import 'package:flutter/material.dart';
import 'package:flutterapp/core/Utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errMessage,
      style: Styles.textStyle20,
      textAlign: TextAlign.center,
    ));
  }
}
