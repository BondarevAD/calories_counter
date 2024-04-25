import 'package:calories_counter/data/entities/product.dart';
import 'package:calories_counter/domain/entities/products.dart';

class ProductsMapper {
  static Products fromData(ProductsData data) {
    final products = <Product>[];
    for (final elem in data.items) {
      products.add(ProductMapper.fromData(elem));
    }
    return Products(items: products);
  }
}

class ProductMapper {
  static Product fromData(ProductData data) {
    return Product(
      name: data.name,
      calories: data.calories,
      servingSizeG: data.servingSizeG,
      fatTotalG: data.fatTotalG,
      fatSaturatedG: data.fatSaturatedG,
      proteinG: data.proteinG,
      sodiumMg: data.sodiumMg,
      potassiumMg: data.potassiumMg,
      cholesterolMg: data.cholesterolMg,
      carbohydratesTotalG: data.carbohydratesTotalG,
      fiberG: data.fiberG,
      sugarG: data.sugarG,
    );
  }
}
