// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../utils/error_handling.dart';
import '../../../utils/utils.dart';
import '../models/user.dart';

class AuthService {
  // Sign up User
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(Uri.parse('/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (!context.mounted) {
        return;
      }
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account Created : Login with same credentials!');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {} catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  /// Gets the user data from Shared Preferences, ie: f alredy signed in
  void getUserData({required BuildContext context}) async {
    try {} catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
