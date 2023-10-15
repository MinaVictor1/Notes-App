import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Utils/styles.dart';
import '../../../../../core/widgets/CustomButton.dart';
import '../../../../../core/widgets/customtextformwidget.dart';
import '../../manger/register_cubit/register_cubit.dart';

class InputRegisterSection extends StatelessWidget {
  const InputRegisterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController userName = TextEditingController();
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'UserName',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextForm(
            hinttext: 'ُEnter Your UserName',
            mycontroller: userName,
          ),
          const SizedBox(
            height: 10,
          ),
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
            height: 20,
          ),
          CustomButton(
            icon: Icons.arrow_forward_ios_rounded,
            onPressed: () {
              if (formkey.currentState!.validate()) {
                BlocProvider.of<RegisterCubit>(context)
                    .addUser(email: email.text, password: password.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
