import 'package:calories_counter/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

abstract class UserRepository {
  Future<User> getUser();

  Future<firebase.User> getCurrentUser();

  Future<void> addNewUser(User user);
}
