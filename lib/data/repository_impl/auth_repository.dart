import 'package:calories_counter/data/data_source/firebase_datasource.dart';
import 'package:calories_counter/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseDataSource _firebaseDataSource;

  AuthRepositoryImpl(this._firebaseDataSource);

  @override
  Future<void> signInWithGoogle() async {
    await _firebaseDataSource.signInWithGoogle();
  }

  @override
  Future<void> signInWithPhone(String phone) async {
    await _firebaseDataSource.signInWithPhoneNumber(phone);
  }

  @override
  Future<void> createAccount(String emailAddress, String password) async {
    await _firebaseDataSource.createAccount(emailAddress, password);
  }

  @override
  Future<void> loginUser(String email, String password) async {
    await _firebaseDataSource.loginUser(email, password);
  }
}
