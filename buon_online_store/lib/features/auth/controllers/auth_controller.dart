import 'package:buon_online_store/features/persitent_bottom_bar/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../apis/auth_api.dart';
import '../../../core/core.dart';

final StateNotifierProvider<AuthController, bool> authControllerProvider =
    StateNotifierProvider<AuthController, bool>(
        (StateNotifierProviderRef<AuthController, bool> ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
  );
});

final FutureProvider<User?> currentUserAccountProvider =
    FutureProvider<User?>((FutureProviderRef<Object?> ref) {
  final AuthController authController =
      ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  AuthController({
    required AuthAPI authAPI,
  })  : _authAPI = authAPI,
        super(false);
  final AuthAPI _authAPI;
  // state = isLoading

  Future<User?> currentUser() => _authAPI.currentUserAccount();
  Future<void> signinWithGoogle(BuildContext context) async {
    state = true;
    final Either<Failure, UserCredential> res =
        await _authAPI.signInWithGoogle();
    state = false;
    res.fold((Failure l) => showSnackBar(context, l.message),
        (UserCredential r) => r);
  }

  Future<void> signinWithFacebook(BuildContext context) async {
    state = true;
    final Either<Failure, UserCredential> res =
        await _authAPI.signInWithFacebook();
    state = false;
    res.fold(
        (Failure l) => showSnackBar(context, l.message),
        (UserCredential r) => Navigator.of(context)
            .pushNamed(HomePage.routeName, arguments: r.user));
  }

  Future<void> signinWithTwitter(BuildContext context) async {
    state = true;
    final Either<Failure, UserCredential> res =
        await _authAPI.signInwithTwitter();
    state = false;
    res.fold(
        (Failure l) => showSnackBar(context, l.message),
        (UserCredential r) => Navigator.of(context)
            .pushNamed(HomePage.routeName, arguments: r.user));
  }

  Future<void> signinWithApple(BuildContext context) async {
    state = true;
    final Either<Failure, UserCredential> res =
        await _authAPI.signInwithApple();
    state = false;
    res.fold(
        (Failure l) => showSnackBar(context, l.message),
        (UserCredential r) => Navigator.of(context)
            .pushNamed(HomePage.routeName, arguments: r.user));
  }
}
