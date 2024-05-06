import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:calories_counter/data/entities/image.dart';

class ImageApiDataSource {
  static const apiKey = '43728449-56abf9adb4cf620d22444cf3a';
  static const baseUrl = 'https://pixabay.com/api/?key=$apiKey&q=';

  Future<ImageData> getImageByName(String name) async {
    final response =
        await http.get(Uri.parse("$baseUrl$name&image_type=photo"));
    if (response.statusCode == 200) {
      return ImageData.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
