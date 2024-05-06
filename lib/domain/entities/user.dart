import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final int height;
  final int weight;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.age,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return User(
      id: data["uid"] as String,
      name: data["name"] as String,
      email: data["email"] as String,
      imageUrl: data["imageUrl"] as String,
      height: data["height"] as int,
      weight: data['weight'] as int,
      age: data['age'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': id,
      "name": name,
      "email": email,
      "imageUrl": imageUrl,
      "height": height,
      'weight': weight,
      'age': age,
    };
  }
}
