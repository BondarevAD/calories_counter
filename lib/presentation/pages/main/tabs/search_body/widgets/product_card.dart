import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/presentation/pages/main/tabs/search_body/widgets/product_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.imageUrl});

  final Product product;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(ProductPage(
        product: product,
        imageUrl: imageUrl,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              height: 90,
              width: 90,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text("Calories: ${product.calories}"),
                Text("Portion: ${product.servingSizeG}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
