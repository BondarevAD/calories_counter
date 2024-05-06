import 'package:calories_counter/data/data_source/api_datasource.dart';
import 'package:calories_counter/data/data_source/firebase_datasource.dart';
import 'package:calories_counter/data/data_source/image_api_datasource.dart';
import 'package:calories_counter/data/entities/day.dart';
import 'package:calories_counter/data/entities/image.dart';
import 'package:calories_counter/data/mappers/product_mapper.dart';
import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ApiDataSource _apiDataSource;
  final FirebaseDataSource _firebaseDataSource;
  final ImageApiDataSource _imageApiDataSource;

  ProductsRepositoryImpl(
      this._apiDataSource, this._firebaseDataSource, this._imageApiDataSource);

  @override
  Future<Products> getProduct(String query) async {
    final data = await _apiDataSource.fetchProduct(query);
    return ProductsMapper.fromData(data);
  }

  @override
  Future<void> addProduct(Product product, User user) async {
    final data = ProductMapper.toData(product);
    await _firebaseDataSource.addProduct(data, user);
  }

  @override
  Future<List<DayData>> getProductsByUser(User user) async {
    final productsData = await _firebaseDataSource.getProductsByUser(user);
    // final products = <Product>[];
    // for (final e in productsData) {
    //   products.add(ProductMapper.fromData(e));
    // }
    return productsData;
  }

  @override
  Future<ImageData> getImageByName(String name) async {
    return await _imageApiDataSource.getImageByName(name);
  }
}
