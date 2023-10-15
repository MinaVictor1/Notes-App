import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/core/widgets/show_snack_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/Utils/styles.dart';
import '../../manger/register_cubit/register_cubit.dart';
import 'inputRegisterSection.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          loading = true;
        } else if (state is RegisterSuccess) {
          loading = false;
          FirebaseAuth.instance.currentUser!.sendEmailVerification();
          GoRouter.of(context).go('/');
        } else if (state is RegisterFailure) {
          errorMessage(context, state.errMessage);
          loading = false;
        } else {
          loading = false;
          errorMessage(context, 'there is an error');
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: loading,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: Styles.textStyle30,
              ),
              InputRegisterSection(),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
