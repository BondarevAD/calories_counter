import 'package:calories_counter/data/entities/day.dart';
import 'package:calories_counter/data/entities/image.dart';
import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/domain/entities/user.dart';

abstract class ProductsRepository {
  Future<Products> getProduct(String query);

  Future<void> addProduct(Product product, User user);

  Future<List<DayData>> getProductsByUser(User user);

  Future<ImageData> getImageByName(String image);
}
