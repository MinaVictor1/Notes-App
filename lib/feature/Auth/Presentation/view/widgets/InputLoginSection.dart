import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/core/Utils/styles.dart';
import 'package:flutterapp/core/widgets/customtextformwidget.dart';
import 'package:flutterapp/core/widgets/message.dart';
import 'package:flutterapp/feature/Auth/Presentation/manger/login_cubit/login_cubit.dart';
import '../../../../../core/widgets/CustomButton.dart';
import 'forgetpass_section.dart';

class InputLoginSection extends StatelessWidget {
  const InputLoginSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextForm(
            hinttext: 'ُEnter Your Email',
            mycontroller: email,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Password',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextForm(
            hinttext: 'ُEnter Your Password',
            mycontroller: password,
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          ForgetPassSection(email: email),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            icon: Icons.arrow_forward_ios_rounded,
            onPressed: () {
              if (formkey.currentState!.validate()) {
                BlocProvider.of<LoginCubit>(context)
                    .loginUser(email: email.text, password: password.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
