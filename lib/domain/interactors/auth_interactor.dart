import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/domain/repositories/auth_repository.dart';
import 'package:calories_counter/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class AuthInteractor {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AuthInteractor(this._authRepository, this._userRepository);

  Future<firebase.User> getCurrentUser() async {
    return _userRepository.getCurrentUser();
  }

  Future<void> signInWithGoogle() async {
    await _authRepository.signInWithGoogle();
  }

  Future<void> signInWithPhoneNumber(String phone) async {
    await _authRepository.signInWithPhone(phone);
  }

  Future<void> createAccount(String emailAddress, String password) async {
    await _authRepository.createAccount(emailAddress, password);
  }

  Future<void> addNewUser(User user) async {
    await _userRepository.addNewUser(user);
  }

  Future<void> loginUser(String email, String password) async {
    await _authRepository.loginUser(email, password);
  }
}
