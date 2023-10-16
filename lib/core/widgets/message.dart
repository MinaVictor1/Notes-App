import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/core/Utils/approuter.dart';
import 'package:flutterapp/feature/home/data/models/notemodel.dart';
import 'package:go_router/go_router.dart';

class Message {
  void sendMessage(BuildContext context, String message) {
    //show message for user
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Message',
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  void deleteItem(BuildContext context, String id, Note note) {
    //show message for user
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'Warning Message',
      desc: "Are you sure to delete this item?",
      btnCancelText: 'Edit',
      btnCancelOnPress: () {
        GoRouter.of(context).pushReplacement(Approute.kEditNote, extra: note);
      },
      btnOkOnPress: () async {
        final currentUser = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance
            .collection('users/${currentUser!.uid}/notes')
            .doc(id)
            .delete();

        GoRouter.of(context).go(Approute.kHomePage);
      },
    ).show();
  }
}
