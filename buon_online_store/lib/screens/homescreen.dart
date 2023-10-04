import 'package:firebase_auth/firebase_auth.dart';

import '../controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? userAuthState = ref.read(authControllerProvider.notifier).state;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Buon'),
          leading: userAuthState != null
              ? IconButton(
                  onPressed: () =>
                      ref.watch(authControllerProvider.notifier).signOut(),
                  icon: const Icon(Icons.logout))
              : null),
    );
  }
}
