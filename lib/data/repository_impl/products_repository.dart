import 'package:calories_counter/data/data_source/api_datasource.dart';
import 'package:calories_counter/data/mappers/product_mapper.dart';
import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ApiDataSource _dataSource;

  ProductsRepositoryImpl(this._dataSource);

  @override
  Future<Products> getProduct(String query) async {
    final data = await _dataSource.fetchProduct(query);
    return ProductsMapper.fromData(data);
  }
}
