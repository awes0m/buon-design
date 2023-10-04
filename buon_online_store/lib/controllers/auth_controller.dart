import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref)..appStarted());

class AuthController extends StateNotifier<User?> {
  final Ref _ref;

  StreamSubscription<User?>? _authChangesSubscription;
  AuthController(
    this._ref,
  ) : super(null) {
    _authChangesSubscription?.cancel();
    _authChangesSubscription = _ref
        .read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authChangesSubscription?.cancel();
    super.dispose();
  }

  void appStarted() async {
    final user = _ref.read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      await _ref.read(authRepositoryProvider).signInAnonymously();
    }
  }

  void signOut() async {
    await _ref.read(authRepositoryProvider).signOut();
  }
}
