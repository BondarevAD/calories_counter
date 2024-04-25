import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user.dart' as user_domain;

class FirebaseDataSource {
  Future<user_domain.User> getUser() async {
    final user = FirebaseAuth.instance.currentUser!;
    CollectionReference users = FirebaseFirestore.instance.collection('user');

    final doc = await users.get();
    return doc.docs
        .map((e) => user_domain.User.fromFirestore(e))
        .toList()
        .where((element) {
      return element.id == user.uid;
    }).first;
  }
}
