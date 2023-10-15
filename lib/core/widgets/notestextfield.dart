import 'package:flutter/material.dart';

class NotesTextFormField extends StatelessWidget {
  const NotesTextFormField({super.key, required this.notesController});

  final TextEditingController notesController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: notesController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          labelText: 'Notes',
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
