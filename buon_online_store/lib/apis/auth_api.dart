import 'package:buon_online_store/core/general_providers.dart';
import 'package:buon_online_store/models/app_user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../core/core.dart';

//want to signup, want to get user account ->Account
//want to access user related data -> Account

final Provider<AuthAPI> authAPIProvider =
    Provider<AuthAPI>((ProviderRef<Object?> ref) {
  return AuthAPI(
      auth: ref.watch(firebaseAuthProvider),
      db: ref.watch(firebaseFirestoreProvider));
});
final FutureProvider<User?> currentUserAccountProvider =
    FutureProvider<User?>((FutureProviderRef<Object?> ref) {
  final AuthAPI authController = ref.watch(authAPIProvider);
  return authController.currentUserAccount();
});

//class defination
abstract class IAuthAPI {
  FutureEither<UserCredential> signUpWithEmail(String email, String password);
  FutureEither<UserCredential> logInWithEmail(String email, String password);
  FutureEither<UserCredential> signInwithApple();
  FutureEither<UserCredential> signInwithTwitter();
  FutureEither<UserCredential> signInWithGoogle();
  FutureEither<UserCredential> signInWithFacebook();
  Future<bool> storeUserInfo(UserCredential credentials);

  Future<User?> currentUserAccount();
  Future<void> signOut();
}

//Implementaion
class AuthAPI implements IAuthAPI {
  AuthAPI({required FirebaseAuth auth, required FirebaseFirestore db})
      : _auth = auth,
        _db = db;
  final FirebaseAuth _auth;
  final FirebaseFirestore _db;

  @override
  FutureEither<UserCredential> signInWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      // Once signed in, return the UserCredential
      UserCredential user =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
      await storeUserInfo(user);

      return right(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          return left(
              Failure("The provider has already been linked to the user."));
        case "invalid-credential":
          return left(Failure("The provider's credential is not valid."));
        case "credential-already-in-use":
          return left(Failure(
              "The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User."));
        default:
          return left(Failure("Unknown error.- ${e.toString()}"));
      }
    }
  }

  @override
  FutureEither<UserCredential> signInWithFacebook() async {
    try {
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({
        'display': 'popup',
      });

      // Once signed in, return the UserCredential
      UserCredential user =
          await FirebaseAuth.instance.signInWithPopup(facebookProvider);

      // Or use signInWithRedirect

      return right(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          return left(
              Failure("The provider has already been linked to the user."));
        case "invalid-credential":
          return left(Failure("The provider's credential is not valid."));
        case "credential-already-in-use":
          return left(Failure(
              "The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User."));
        default:
          return left(Failure("Unknown error.- ${e.toString()}"));
      }
    }
  }

  @override
  FutureEither<UserCredential> signInwithApple() async {
    try {
      final provider = OAuthProvider("apple.com")
        ..addScope('email')
        ..addScope('name');

      // Sign in the user with Firebase.
      return right(await FirebaseAuth.instance.signInWithPopup(provider));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          return left(
              Failure("The provider has already been linked to the user."));
        case "invalid-credential":
          return left(Failure("The provider's credential is not valid."));
        case "credential-already-in-use":
          return left(Failure(
              "The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User."));
        default:
          return left(Failure("Unknown error.- ${e.toString()}"));
      }
    }
  }

  @override
  FutureEither<UserCredential> signInwithTwitter() async {
    try {
      TwitterAuthProvider twitterProvider = TwitterAuthProvider();
      UserCredential credential =
          await FirebaseAuth.instance.signInWithPopup(twitterProvider);
      await storeUserInfo(credential);
      // Once signed in, return the UserCredential
      return right(credential);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          return left(
              Failure("The provider has already been linked to the user."));
        case "invalid-credential":
          return left(Failure("The provider's credential is not valid."));
        case "credential-already-in-use":
          return left(Failure(
              "The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User."));
        default:
          return left(Failure("Unknown error.- ${e.toString()}"));
      }
    }
  }

  @override
  Future<User> currentUserAccount() async => _auth.currentUser!;

  @override
  FutureEither<UserCredential> logInWithEmail(
      String email, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await _db
          .collection('users')
          .doc(credential.user!.uid)
          .get()
          .then((value) => {
                if (!value.exists) {storeUserInfo(credential)}
              });

      return right(credential);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          return left(Failure('No user found for that email.'));

        case 'wrong-password':
          return left(Failure('Wrong password provided for that user.'));

        default:
          return left(Failure(e.toString()));
      }
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  FutureEither<UserCredential> signUpWithEmail(
      String email, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await storeUserInfo(credential);

      return right(credential);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          return left(Failure('No user found for that email.'));

        case 'wrong-password':
          return left(Failure('Wrong password provided for that user.'));

        default:
          return left(Failure(e.toString()));
      }
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<bool> storeUserInfo(UserCredential credentials) async {
    final AppUserInfo userInfo = AppUserInfo(
        uid: credentials.user!.uid,
        name: credentials.user!.displayName ?? '',
        email: credentials.user!.email ?? '',
        profilePhoto: credentials.user!.photoURL ?? '');
    try {
      final collectionReference = _db.collection("users");

      await collectionReference.doc(userInfo.uid).set(userInfo.toJson());
      return true;
    } on FirebaseException {
      return false;
    } catch (e) {
      return false;
    }
  }
}
