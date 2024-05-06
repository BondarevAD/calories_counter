import 'package:calories_counter/data/entities/product.dart';

class DayData {
  DayData({
    required this.products,
    required this.date,
  });

  factory DayData.fromJson(Map<String, dynamic> json) {
    return DayData(
      products: ProductsData.fromJson(json['products'] as Map<String, dynamic>),
      date: json['date'],
    );
  }

  final ProductsData products;
  final String date;
}
