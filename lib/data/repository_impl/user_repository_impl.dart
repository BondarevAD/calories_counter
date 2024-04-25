import 'package:calories_counter/data/data_source/firebase_datasource.dart';
import 'package:calories_counter/data/mappers/user_mapper.dart';
import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<User> getUser() async {
    return await _dataSource.getUser();
  }
}
