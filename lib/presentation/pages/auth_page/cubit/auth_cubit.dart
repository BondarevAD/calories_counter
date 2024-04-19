import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      await FirebaseAuth.instance.signInWithPopup(googleProvider);

      emit(Authenticated());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signInAnonymously() async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.signInAnonymously();
      emit(Authenticated());
    } on FirebaseAuthException {
      rethrow;
    }
  }

  void loginWithPhoneNumber(String phoneNumber) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      emit(AuthError('Failed to login with phone number: $e'));
    }
  }

  void verifyOtp(String otp) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(Authenticated());
    } catch (e) {
      emit(AuthError('Failed to verify otp: $e'));
    }
  }
}
