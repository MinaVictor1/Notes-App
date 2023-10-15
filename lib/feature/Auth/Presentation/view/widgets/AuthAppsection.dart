import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/core/Utils/approuter.dart';
import 'package:flutterapp/core/Utils/sign_in_with_apps.dart';
import 'package:flutterapp/feature/Auth/Presentation/view/widgets/AuthAppButton.dart';
import 'package:go_router/go_router.dart';

class AuthWithApps extends StatelessWidget {
  const AuthWithApps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AuthButton(
          icon: 'asset/icons/google.png',
          text: 'Google',
          onPressed: () {
            SignInWithApps().signInWithGoogle();
          },
        ),
        AuthButton(
          icon: 'asset/icons/facebook.png',
          text: 'FaceBook',
          onPressed: () {},
        ),
      ],
    );
  }
}
