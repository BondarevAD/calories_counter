class Products {
  List<Product> items;

  Products({
    required this.items,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        items:
            List<Product>.from(json["items"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Product {
  String name;
  double calories;
  int servingSizeG;
  double fatTotalG;
  int fatSaturatedG;
  double proteinG;
  int sodiumMg;
  int potassiumMg;
  int cholesterolMg;
  double carbohydratesTotalG;
  double fiberG;
  double sugarG;

  Product({
    required this.name,
    required this.calories,
    required this.servingSizeG,
    required this.fatTotalG,
    required this.fatSaturatedG,
    required this.proteinG,
    required this.sodiumMg,
    required this.potassiumMg,
    required this.cholesterolMg,
    required this.carbohydratesTotalG,
    required this.fiberG,
    required this.sugarG,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        calories: json["calories"]?.toDouble(),
        servingSizeG: json["serving_size_g"],
        fatTotalG: json["fat_total_g"]?.toDouble(),
        fatSaturatedG: json["fat_saturated_g"],
        proteinG: json["protein_g"]?.toDouble(),
        sodiumMg: json["sodium_mg"],
        potassiumMg: json["potassium_mg"],
        cholesterolMg: json["cholesterol_mg"],
        carbohydratesTotalG: json["carbohydrates_total_g"]?.toDouble(),
        fiberG: json["fiber_g"]?.toDouble(),
        sugarG: json["sugar_g"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "calories": calories,
        "serving_size_g": servingSizeG,
        "fat_total_g": fatTotalG,
        "fat_saturated_g": fatSaturatedG,
        "protein_g": proteinG,
        "sodium_mg": sodiumMg,
        "potassium_mg": potassiumMg,
        "cholesterol_mg": cholesterolMg,
        "carbohydrates_total_g": carbohydratesTotalG,
        "fiber_g": fiberG,
        "sugar_g": sugarG,
      };
}
