import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Utils/approuter.dart';

class SignInOrNot {
  void checkifSign(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        GoRouter.of(context).push(Approute.kHomePage);
        print('User is signed in!');
      }
    });
  }
}
