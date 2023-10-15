import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void errorMessage(BuildContext context, String message) {
  //show message for user
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    title: 'Error',
    desc: message,
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  ).show();
}
