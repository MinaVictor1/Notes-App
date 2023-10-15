import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/core/Utils/styles.dart';

import '../../../../../core/widgets/message.dart';
import '../../../../../core/widgets/show_snack_bar.dart';

class ForgetPassSection extends StatelessWidget {
  const ForgetPassSection({
    super.key,
    required this.email,
  });

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (email.text == '') {
          errorMessage(context, 'Enter Your Mail');
          return;
        }
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
        Message()
            .sendMessage(context, 'A password reset message has been sent');
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Forget Your Password? ',
            style: Styles.textStyle16,
          ),
        ],
      ),
    );
  }
}
