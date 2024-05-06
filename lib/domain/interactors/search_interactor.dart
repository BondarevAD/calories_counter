import 'package:calories_counter/data/entities/image.dart';
import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/domain/repositories/products_repository.dart';
import 'package:calories_counter/domain/repositories/user_repository.dart';

class SearchInteractor {
  final ProductsRepository _productsRepository;
  final UserRepository _userRepository;

  SearchInteractor(this._productsRepository, this._userRepository);

  Future<Products> getProducts(String query) {
    return _productsRepository.getProduct(query);
  }

  Future<void> addProduct(Product product, User user) async {
    await _productsRepository.addProduct(product, user);
  }

  Future<User> getUser() async {
    return await _userRepository.getUser();
  }

  Future<ImageData> getImageByName(String name) async {
    return _productsRepository.getImageByName(name);
  }
}
