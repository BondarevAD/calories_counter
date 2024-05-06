import 'package:calories_counter/domain/entities/user.dart' as user_domain;
import 'package:calories_counter/domain/interactors/auth_interactor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._interactor) : super(AuthInitial());

  final AuthInteractor _interactor;

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      await _interactor.signInWithGoogle();
    } catch (e) {
      emit(AuthError(e.toString()));
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

  Future<void> loginWithPhoneNumber(String phoneNumber) async {
    try {
      await _interactor.signInWithPhoneNumber("s");
    } catch (e) {
      emit(AuthError('Failed to login with phone number: $e'));
    }
  }

  Future<void> createAccount(String emailAddress, String password) async {
    try {
      await _interactor.createAccount(emailAddress, password);
    } catch (e) {
      print(e.toString());
      emit(AuthError('Failed to create account: $e'));
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

  Future<void> createNewUser(
      String name, int age, int weight, int height) async {
    try {
      final currentUser = await _interactor.getCurrentUser();
      print(currentUser);
      final user = user_domain.User(
        id: currentUser.uid,
        name: name,
        email: currentUser.email!,
        age: age,
        height: height,
        weight: weight,
        imageUrl: '',
      );
      await _interactor.addNewUser(user);
    } catch (e) {
      print("$e");
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await _interactor.loginUser(email, password);
    } catch (e) {
      print(e);
    }
  }
}
