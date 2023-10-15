import 'package:flutter/material.dart';
import 'package:flutterapp/feature/home/Presentation/view/widgets/editnotebody.dart';
import 'package:flutterapp/feature/home/data/models/notemodel.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key, required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit item'),
          ),
          body: EditNoteBody(
            note: note,
          )),
    );
  }
}
