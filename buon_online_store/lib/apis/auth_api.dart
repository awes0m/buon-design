import 'package:buon_online_store/core/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../core/core.dart';

//want to signup, want to get user account ->Account
//want to access user related data -> Account

final Provider<AuthAPI> authAPIProvider =
    Provider<AuthAPI>((ProviderRef<Object?> ref) {
  final FirebaseAuth auth = ref.watch(firebaseAuthProvider);
  return AuthAPI(auth: auth);
});
final FutureProvider<User?> currentUserAccountProvider =
    FutureProvider<User?>((FutureProviderRef<Object?> ref) {
  final AuthAPI authController = ref.watch(authAPIProvider);
  return authController.currentUserAccount();
});

//class defination
abstract class IAuthAPI {
  FutureEither<UserCredential> signInwithApple();
  FutureEither<UserCredential> signInwithTwitter();
  FutureEither<UserCredential> signInWithGoogle();
  FutureEither<UserCredential> signInWithFacebook();
  Future<User?> currentUserAccount();
}

//Implementaion
class AuthAPI implements IAuthAPI {
  AuthAPI({required FirebaseAuth auth}) : _auth = auth;
  final FirebaseAuth _auth;

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

      // Once signed in, return the UserCredential
      return right(
          await FirebaseAuth.instance.signInWithPopup(twitterProvider));
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
}
