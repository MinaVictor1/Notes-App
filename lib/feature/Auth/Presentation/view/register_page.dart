import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/register_cubit/register_cubit.dart';
import 'widgets/RegisterPageBody.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const RegisterPageBody(),
      )),
    );
  }
}
