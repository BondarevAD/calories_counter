import 'package:calories_counter/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();
}
