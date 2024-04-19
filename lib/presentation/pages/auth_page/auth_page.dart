import 'dart:io';

import 'package:calories_counter/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:calories_counter/presentation/resources/AppResources.dart';
import 'package:calories_counter/presentation/widgets/app_button.dart';
import 'package:calories_counter/presentation/widgets/app_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body,
    );
  }

  Widget get _body {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Calories Counter!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 200),
            child: AppOutlinedButton(
              text: "Login with Google",
              icon: AppAssetImage.google,
            ),
          ),
          if (Platform.isIOS)
            const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                AppOutlinedButton(
                  text: "Login with Apple ID",
                  icon: AppAssetImage.apple,
                ),
              ],
            ),
          const SizedBox(
            height: 10,
          ),
          const AppOutlinedButton(
            text: "Login with phone",
            icon: AppAssetImage.phone,
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("or"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          AppButton(
            text: "Create new account",
            onTap: () => Get.to(const SignUpPage()),
          ),
        ],
      ),
    );
  }
}
