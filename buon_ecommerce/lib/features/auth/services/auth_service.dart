// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/utils.dart';

class AuthService {
  // Sign up User
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // TODO: on sucessful authentication
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// SIGN IN User
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      // final credential =
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // TODO: on sucessful authentication
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//gmailSignIn
  void googleSignIn(BuildContext context) async {
    try {
      // google sign in for web
      if (!kIsWeb) {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        // return await FirebaseAuth.instance.signInWithCredential(credential);
        await FirebaseAuth.instance.signInWithCredential(credential);
        // TODO: on sucessful authentication
      } else {
        // Create a new provider
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

        // Once signed in, return the UserCredential
        // return await FirebaseAuth.instance.signInWithPopup(googleProvider);
        await FirebaseAuth.instance.signInWithPopup(googleProvider);

        // Or use signInWithRedirect
        // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);

        await FirebaseAuth.instance.signInWithRedirect(googleProvider);
        // TODO: on sucessful authentication
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //SIGN OUT User
  void signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      showSnackBar(context, "Logged Out Sucessfully!");
      // TODO: on sucessful logout
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
