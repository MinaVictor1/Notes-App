import 'package:flutter/material.dart';
import 'package:flutterapp/core/Utils/cloudstore.dart';
import 'package:flutterapp/core/widgets/CustomButton.dart';
import 'package:flutterapp/core/widgets/customtextformwidget.dart';
import 'package:flutterapp/core/widgets/notestextfield.dart';

class AddCategoryBody extends StatelessWidget {
  const AddCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey();
    final TextEditingController title = TextEditingController();
    final TextEditingController note = TextEditingController();

    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextForm(
              hinttext: 'Enter Your title',
              mycontroller: title,
            ),
            const SizedBox(height: 12),
            NotesTextFormField(notesController: note),
            const SizedBox(height: 12),
            CustomButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    CloudStore().addNote(title.text, note.text, context);
                  }
                },
                icon: Icons.done_sharp)
          ],
        ),
      ),
    );
  }
}
