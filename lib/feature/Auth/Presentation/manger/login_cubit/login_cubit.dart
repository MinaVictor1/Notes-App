import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
      print('Done');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(LoginFaliure(errMessage: 'Invalid email format.'));
        print('Invalid email format.');
      } else if (e.code == 'wrong-password') {
        emit(LoginFaliure(errMessage: 'Incorrect password.'));
        print('Incorrect password.');
      } else if (e.code == 'user-not-found') {
        emit(LoginFaliure(errMessage: 'No user found with this email.'));
        print('No user found with this email.');
      } else {
        emit(LoginFaliure(errMessage: 'An error occurred.'));
        print('An error occurred: ${e.message}');
      }
    }
  }
}
