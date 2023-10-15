import 'package:flutter/material.dart';
import 'package:flutterapp/feature/home/data/models/notemodel.dart';
import 'widgets/titlenote.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TitleContentPage(content: note.note, title: note.title),
    );
  }
}
