import 'package:flutter/material.dart';

class CustomFormTextFieldedittitle extends StatelessWidget {
  const CustomFormTextFieldedittitle(
      {super.key, this.onchanged, required this.initialValue}); //defult value

  final Function(String)? onchanged;
  final String initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onchanged,
      decoration: InputDecoration(
          labelText: 'Title',
          labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          fillColor: Colors.grey[170],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 184, 184, 184))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey))),
    );
  }
}
