import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/core/Utils/approuter.dart';
import 'package:flutterapp/core/widgets/message.dart';
import 'package:flutterapp/core/widgets/show_snack_bar.dart';
import 'package:go_router/go_router.dart';

class CloudStore {
  CollectionReference notesCollection = FirebaseFirestore.instance
      .collection('users/${FirebaseAuth.instance.currentUser!.uid}/notes');

  Future<void> addNote(String title, String note, BuildContext context) {
    // Call the user's CollectionReference to add a new user
    return notesCollection.add({
      'title': title,
      'note': note,
    }).then((value) {
      print("Item Added");
      Message().sendMessage(context, 'Item Added');
      GoRouter.of(context).pushReplacement(Approute.kHomePage);
    }).catchError((error) {
      print("Failed to add user: $error");
      errorMessage(context, 'Failed to add user: $error');
    });
  }

  Future<void> editNote(String documentId, String newTitle, String newNote,
      BuildContext context) {
    return notesCollection.doc(documentId).update({
      'title': newTitle,
      'note': newNote,
    }).then((value) {
      print("Note Updated");
      Message().sendMessage(context, 'Note Updated');
      GoRouter.of(context).pushReplacement(Approute.kHomePage);
    }).catchError((error) {
      print("Failed to update note: $error");
      errorMessage(context, 'Failed to update note: $error');
    });
  }
}
