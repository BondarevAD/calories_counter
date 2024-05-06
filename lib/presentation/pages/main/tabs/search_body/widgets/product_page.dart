import 'package:calories_counter/domain/entities/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    required this.product,
    required this.imageUrl,
  });

  final Product product;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body(context),
    );
  }

  AppBar get _appBar {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_left),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              height: 150,
              width: 150,
            ),
          ),
          Column(
            children: [
              Text(product.name),
              Text(product.servingSizeG.toString()),
              Text("Calories: ${product.calories} kCal"),
              Text("Protein: ${product.proteinG} g"),
              Text("Carbohydrates: ${product.carbohydratesTotalG} g"),
              Text("Fat: ${product.fatTotalG} g"),
              Text("Sugar: ${product.sugarG} g")
            ],
          )
        ],
      ),
    );
  }
}
