import 'package:flutter/material.dart';
import 'package:flutterapp/core/Utils/cloudstore.dart';
import 'package:flutterapp/feature/home/Presentation/view/widgets/customformtextfieldtitle.dart';
import 'package:flutterapp/feature/home/data/models/notemodel.dart';

import '../../../../../core/widgets/CustomButton.dart';
import 'CustomFormTextFieldeditnote.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    String title = note.title;
    String notes = note.note;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomFormTextFieldedittitle(
          initialValue: note.title,
          onchanged: (p0) {
            title = p0;
          },
        ),
        CustomFormTextFieldeditNote(
          initialValue: note.note,
          onchanged: (p0) {
            notes = p0;
          },
        ),
        CustomButton(
            onPressed: () {
              CloudStore().editNote(note.id, title, notes, context);
            },
            icon: Icons.save)
      ],
    );
  }
}
