import 'package:calories_counter/data/entities/day.dart';
import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/domain/repositories/products_repository.dart';
import 'package:calories_counter/domain/repositories/user_repository.dart';

class HomeInteractor {
  final UserRepository _userRepository;
  final ProductsRepository _productsRepository;

  HomeInteractor(this._userRepository, this._productsRepository);

  Future<List<DayData>> getProductsByUser() async {
    final user = await _userRepository.getUser();
    return _productsRepository.getProductsByUser(user);
  }
}
