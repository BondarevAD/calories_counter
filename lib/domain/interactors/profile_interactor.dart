import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/domain/repositories/user_repository.dart';

class ProfileInteractor {
  final UserRepository _userRepository;

  ProfileInteractor(this._userRepository);

  Future<User> getUser() {
    return _userRepository.getUser();
  }
}
