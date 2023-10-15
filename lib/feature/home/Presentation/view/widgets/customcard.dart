import 'package:flutter/material.dart';
import 'package:flutterapp/core/widgets/message.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Utils/approuter.dart';
import '../../../data/models/notemodel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(Approute.kTitleNote, extra: note);
      },
      onLongPress: () {
        Message().deleteItem(context, note.id, note);
      },
      child: Card(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(18),
            child: Image.asset(
              'asset/icons/notes.png',
              height: height / 8,
            ),
          ),
          Text(note.title)
        ]),
      ),
    );
  }
}
