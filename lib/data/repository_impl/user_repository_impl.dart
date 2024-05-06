import 'package:calories_counter/data/data_source/firebase_datasource.dart';
import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class UserRepositoryImpl extends UserRepository {
  final FirebaseDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<User> getUser() async {
    return await _dataSource.getUser();
  }

  @override
  Future<void> addNewUser(User user) async {
    await _dataSource.addNewUser(user);
  }

  @override
  Future<firebase.User> getCurrentUser() async {
    return _dataSource.getCurrentUser();
  }
}
