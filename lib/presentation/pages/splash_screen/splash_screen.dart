import 'dart:async';

import 'package:calories_counter/presentation/pages/auth_page/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.off(const AuthPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SizedBox(
            height: 250,
            width: 250,
            child: Image.asset("assets/images/app_icon.png"),
          ),
        ),
      ),
    );
  }
}
