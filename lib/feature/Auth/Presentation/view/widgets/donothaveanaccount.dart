import 'package:flutter/material.dart';
import 'package:flutterapp/core/Utils/approuter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Utils/styles.dart';

class CreateAnAccount extends StatelessWidget {
  const CreateAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(Approute.kRegisterPage);
      },
      child: const Text.rich(TextSpan(children: [
        TextSpan(text: "Don't Have An Acconut? ", style: Styles.textStyle16),
        TextSpan(text: " Register", style: Styles.textStyle18)
      ])),
    );
  }
}
