import 'dart:math';

import 'package:calories_counter/data/entities/day.dart';
import 'package:calories_counter/data/entities/product.dart';
import 'package:calories_counter/domain/entities/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/user.dart' as user_domain;

class FirebaseDataSource {
  User getCurrentUser() {
    return FirebaseAuth.instance.currentUser!;
  }

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

  Future<void> addProduct(ProductData product, user_domain.User user) async {
    final id = Random().nextInt(10000);

    final nutritionRef = FirebaseFirestore.instance
        .collection("products")
        .doc(user.id)
        .collection("Nutrition");

    final nutritionGet = await nutritionRef.get();

    final today = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final formatted = formatter.format(today);

    final docRef = nutritionRef.doc(formatted.toString());

    await docRef.set({
      'id': nutritionGet.size,
    });
    final productRef = docRef
        .collection("products")
        .withConverter(
          fromFirestore: ProductData.fromFirestore,
          toFirestore: (ProductData product, options) => product.toJson(),
        )
        .doc(id.toString());
    print("psps");
    await productRef.set(product);
  }

  Future<List<DayData>> getProductsByUser(user_domain.User user) async {
    try {
      final nutritionRef = FirebaseFirestore.instance
          .collection("/products/${user.id}/Nutrition");
      final product = await nutritionRef.get();

      final result = <DayData>[];
      for (final elem in product.docs) {
        final elems = elem.reference.collection("products").withConverter(
              fromFirestore: ProductData.fromFirestore,
              toFirestore: (ProductData product, _) => product.toJson(),
            );
        final info = await elems.get();
        final prods = <ProductData>[];
        for (final e in info.docs) {
          prods.add(e.data());
        }
        result.add(DayData(
          products: ProductsData(items: prods),
          date: elem.id,
        ));
      }
      return result;
    } catch (e) {
      print('Error retrieving documents: $e');
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    // if (!Platform.isAndroid) {
    // print("hello");
    final GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    await FirebaseAuth.instance.signInWithPopup(googleProvider);
    // } else {
    // final GoogleSignIn googleSignIn = GoogleSignIn();

    // final googleSignInAccount = await googleSignIn.signIn();
    // final GoogleSignInAuthentication googleSignInAuthentication =
    //     await googleSignInAccount!.authentication;

    // final AuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );
    // final UserCredential userCredential =
    //     await FirebaseAuth.instance.signInWithCredential(credential);
    // final User? user = userCredential.user;
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    ConfirmationResult confirmationResult =
        await auth.signInWithPhoneNumber('+375447638957');
    UserCredential userCredential = await confirmationResult.confirm('666666');
  }

  Future<void> createAccount(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> addNewUser(user_domain.User user) async {
    try {
      final users = FirebaseFirestore.instance.collection('user').doc(user.id);

      await users.set(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("ll");
    } catch (e) {
      print(e);
    }
  }
}
