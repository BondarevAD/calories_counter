import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  factory User.fromFirestore(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return User(
        id: data["uid"] as String,
        name: data["name"] as String,
        email: data["email"] as String,
        imageUrl: data["imageUrl"] as String);
  }
}
