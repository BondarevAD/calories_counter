import 'dart:convert';

import 'package:calories_counter/data/entities/product.dart';
import 'package:http/http.dart' as http;

class ApiDataSource {
  static const String apiKey = "U3dWwsb/ix4oCLPoDZuF4A==G71zqxUkXnAsjZhZ";
  static const String baseUrl =
      "https://api.calorieninjas.com/v1/nutrition?query=";

  Future<ProductsData> fetchProduct(String query) async {
    final response = await http.get(Uri.parse("{$baseUrl}$query"));
    if (response.statusCode == 200) {
      return ProductsData.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
