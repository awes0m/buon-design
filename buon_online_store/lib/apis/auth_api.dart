import 'dart:convert';

import 'package:buon_online_store/core/general_providers.dart';
import 'package:buon_online_store/models/app_user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
final FutureProviderFamily<AppUserInfo?, String> appUserInfoProvider =
    FutureProvider.family<AppUserInfo?, String>((ref, uid) async {
  final AuthAPI authController = ref.watch(authAPIProvider);
  return authController.getUserInfo(uid);
});

//class defination
abstract class IAuthAPI {
  FutureEither<UserCredential> signUpWithEmail(String email, String password);
  FutureEither<AppUserInfo?> logInWithEmail(String email, String password);
  FutureEither<AppUserInfo?> signInwithApple();
  FutureEither<AppUserInfo?> signInwithTwitter();
  FutureEither<AppUserInfo?> signInWithGoogle();
  FutureEither<AppUserInfo?> signInWithFacebook();
  Future<bool> storeUserInfo(UserCredential credentials);
  Future<AppUserInfo?> getUserInfo(String uid);
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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<bool> storeUserInfo(UserCredential credentials) async {
    final AppUserInfo userInfo = AppUserInfo(
        uid: credentials.user!.uid,
        name: credentials.user!.displayName ?? '',
        email: credentials.user!.email ?? '',
        profilePhoto: credentials.user!.photoURL ?? '');
    try {
      final SharedPreferences prefs = await _prefs;
      //store in db
      await _db
          .collection("users")
          .doc(userInfo.uid.toString())
          .set(userInfo.toJson());
      //store to shared prefs
      prefs.setString('userInfo', userInfo.toJson().toString());

      return true;
    } on Exception {
      return false;
    }
  }

  @override
  Future<AppUserInfo?> getUserInfo(String uid) async {
    try {
      AppUserInfo? userInfo;
      final prefs = await _prefs;
      if (prefs.get('userInfo') != null) {
        userInfo =
            AppUserInfo.fromJson(jsonDecode(prefs.getString('userInfo')!));
      } else {
        _db
            .collection('users')
            .where('uid', isEqualTo: uid)
            .snapshots()
            .listen((data) {
          print(data.docs[0].data().toString());
          userInfo = AppUserInfo.fromJson(data.docs[0].data());
          print('data found');
          print(userInfo!.toJson().toString());
          prefs.setString('userInfo', userInfo!.toJson().toString());
        });
      }

      return userInfo;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  FutureEither<AppUserInfo?> signInWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      // Once signed in, return the UserCredential
      UserCredential user =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);

      var res = await getUserInfo(user.user!.uid);

      if (res == null) {
        await storeUserInfo(user);
      }
      return right(await getUserInfo(user.user!.uid));
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
  FutureEither<AppUserInfo?> signInWithFacebook() async {
    try {
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({
        'display': 'popup',
      });

      // Once signed in, return the UserCredential
      UserCredential user =
          await FirebaseAuth.instance.signInWithPopup(facebookProvider);

      var res = await getUserInfo(user.user!.uid);

      if (res == null) {
        await storeUserInfo(user);
      }
      return right(await getUserInfo(user.user!.uid));
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
  FutureEither<AppUserInfo?> signInwithApple() async {
    try {
      final provider = OAuthProvider("apple.com")
        ..addScope('email')
        ..addScope('name');

      // Sign in the user with Firebase.
      var user = await FirebaseAuth.instance.signInWithPopup(provider);
      var res = await getUserInfo(user.user!.uid);

      if (res == null) {
        await storeUserInfo(user);
      }
      return right(await getUserInfo(user.user!.uid));
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
  FutureEither<AppUserInfo?> signInwithTwitter() async {
    try {
      TwitterAuthProvider twitterProvider = TwitterAuthProvider();
      UserCredential user =
          await FirebaseAuth.instance.signInWithPopup(twitterProvider);
      var res = await getUserInfo(user.user!.uid);

      if (res == null) {
        await storeUserInfo(user);
      }
      return right(await getUserInfo(user.user!.uid));
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
  FutureEither<AppUserInfo?> logInWithEmail(
      String email, String password) async {
    try {
      final UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var res = await getUserInfo(user.user!.uid);

      if (res == null) {
        await storeUserInfo(user);
      }
      return right(await getUserInfo(user.user!.uid));
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
}
