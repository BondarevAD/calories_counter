import 'dart:io';

import 'package:calories_counter/presentation/resources/AppResources.dart';
import 'package:calories_counter/presentation/widgets/app_button.dart';
import 'package:calories_counter/presentation/widgets/app_outlined_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    return const Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          Row(
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
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: AppOutlinedButton(
              text: "Login with Google",
              icon: AppAssetImage.google,
            ),
          ),
          if (!kIsWeb)
            if (Platform.isIOS)
              Column(
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
          SizedBox(
            height: 10,
          ),
          AppOutlinedButton(
            text: "Login with phone",
            icon: AppAssetImage.phone,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("or"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          AppButton(
            text: "Create new account",
          ),
        ],
      ),
    );
  }
}
