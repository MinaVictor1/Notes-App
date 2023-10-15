import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/feature/Auth/Presentation/manger/login_cubit/login_cubit.dart';
import '../../../../core/checks/signinornot.dart';
import 'widgets/loginpagebody.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignInOrNot().checkifSign(context);
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginPageBody(),
      )),
    );
  }
}
