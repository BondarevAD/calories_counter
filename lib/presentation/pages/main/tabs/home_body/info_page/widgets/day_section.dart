import 'package:calories_counter/data/entities/day.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DayInfo extends StatelessWidget {
  const DayInfo({super.key, required this.day});

  final DayData day;

  double getProteins() {
    var proteins = 0.0;
    for (final product in day.products.items) {
      proteins += product.proteinG;
    }
    return proteins;
  }

  double getCarbs() {
    var carbs = 0.0;
    for (final product in day.products.items) {
      carbs += product.carbohydratesTotalG;
    }
    return carbs;
  }

  double getFat() {
    var fat = 0.0;
    for (final product in day.products.items) {
      fat += product.fatTotalG;
    }
    return fat;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30.0,
        left: 5.0,
      ),
      child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.green[200],
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Protein",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${getProteins()} g",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Carbs",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${getCarbs()} g",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Fat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${getFat()} g",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
