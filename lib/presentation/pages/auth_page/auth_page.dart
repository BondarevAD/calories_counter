import 'dart:io';

import 'package:calories_counter/presentation/pages/auth_page/widgets/login_page.dart';
import 'package:calories_counter/presentation/pages/auth_page/widgets/new_account_page.dart';
import 'package:calories_counter/presentation/pages/main/main_page.dart';
import 'package:calories_counter/presentation/resources/AppResources.dart';
import 'package:calories_counter/presentation/widgets/app_button.dart';
import 'package:calories_counter/presentation/widgets/app_outlined_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import 'cubit/auth_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
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
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: AppOutlinedButton(
              text: "Login with Google",
              icon: AppAssetImage.google,
              onTap: () async {
                try {
                  await BlocProvider.of<AuthCubit>(context).signInWithGoogle();
                  if (context.mounted) {
                    Get.off(MainPage());
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
          ),
          if (!kIsWeb)
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
          SizedBox(
            height: 10,
          ),
          AppOutlinedButton(
            text: "Login with phone",
            icon: AppAssetImage.phone,
            onTap: () async => await BlocProvider.of<AuthCubit>(context)
                .loginWithPhoneNumber("2"),
          ),
          SizedBox(
            height: 10,
          ),
          AppOutlinedButton(
            text: "Login with Email",
            icon: AppAssetImage.email,
            onTap: () => Get.to(LoginPage()),
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
            onTap: () => Get.to(
              CreateAccountPage(),
            ),
          ),
        ],
      ),
    );
  }
}
