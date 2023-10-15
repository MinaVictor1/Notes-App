import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> addUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(RegisterFailure(errMessage: 'Invalid email format.'));
      } else if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'The password provided is too weak.'));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errMessage: 'The account already exists for that email.'));
        print('The account already exists for that email.');
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
      print(e);
    }
  }
}
