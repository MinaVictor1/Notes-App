import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/constant.dart';
import 'package:meta/meta.dart';

import '../models/notemodel.dart';

part 'getdata_state.dart';

class GetdataCubit extends Cubit<GetdataState> {
  GetdataCubit() : super(GetdataInitial());

  void fetchData() {
    emit(GetdataLoading());

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      emit(GetdataFaluire("User not authenticated"));
      return;
    }

    // Update the notesCollection to point to the subcollection under the current user's document
    final notesCollection = FirebaseFirestore.instance
        .collection('users/${currentUser.uid}/$collectionName');

    notesCollection.get().then((QuerySnapshot querySnapshot) {
      final List<Note> notes = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final id = doc.id;
        return Note(
          id: id,
          title: data[noteTitle] as String,
          note: data[collectionNote] as String,
        );
      }).toList();

      emit(GetdataSuccess(notes));
    }).catchError((error) {
      emit(GetdataFaluire('Failed to fetch data: $error'));
    });
  }
}
