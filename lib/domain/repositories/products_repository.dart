import 'package:calories_counter/domain/entities/products.dart';

abstract class ProductsRepository {
  Future<Products> getProduct(String query);
}
