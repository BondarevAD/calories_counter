import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/domain/repositories/products_repository.dart';

class SearchInteractor {
  final ProductsRepository _productsRepository;

  SearchInteractor(this._productsRepository);

  Future<Products> getProducts(String query) {
    return _productsRepository.getProduct(query);
  }
}
