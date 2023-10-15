import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/core/Utils/styles.dart';
import 'package:flutterapp/feature/Auth/Presentation/manger/login_cubit/login_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/Utils/approuter.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import 'AuthAppsection.dart';
import 'InputLoginSection.dart';
import 'donothaveanaccount.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            GoRouter.of(context).pushReplacement(Approute.kHomePage);
          } else {
            errorMessage(context, 'Please verify your acount');
          }
        } else if (state is LoginFaliure) {
          errorMessage(context, state.errMessage);
          isLoading = false;
        } else {
          isLoading = false;
          errorMessage(context, 'there is an error');
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: Styles.textStyle30,
              ),
              InputLoginSection(),
              AuthWithApps(),
              CreateAnAccount()
            ],
          ),
        ),
      ),
    );
  }
}
