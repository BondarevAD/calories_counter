import 'package:calories_counter/presentation/pages/auth_page/cubit/auth_cubit.dart';
import 'package:calories_counter/presentation/pages/auth_page/widgets/app_text_field.dart';
import 'package:calories_counter/presentation/pages/auth_page/widgets/user_info_page.dart';
import 'package:calories_counter/presentation/pages/main/main_page.dart';
import 'package:calories_counter/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _goToMainPage(BuildContext context) async {
    // if (nameFormKey.currentState!.validate() &&
    //     phoneFormKey.currentState!.validate()) {
    //   context.navigator.push(
    //     MaterialPageRoute(
    //       builder: (_) => const VerificationPage(),
    //     ),
    //   );
    // }

    await BlocProvider.of<AuthCubit>(context).loginUser(
      emailController.text,
      passwordController.text,
    );
    Get.off(() => MainPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Login to account",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Form(
            key: emailFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: AppTextField(
              controller: emailController,
              label: "Email",
              hintText: "Enter your email",
              bottomText: "please enter a real email",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                // if (!RegExp(r'^\+[0-9]+$').hasMatch(value)) {
                //   return "Phone number must start with '+' and contain only digits";
                // }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          Form(
            key: passwordFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: AppTextField(
              controller: passwordController,
              label: "Password",
              hintText: "Enter password",
              bottomText: "Please enter a right password",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                // if (!RegExp(r'^\+[0-9]+$').hasMatch(value)) {
                //   return "Phone number must start with '+' and contain only digits";
                // }
                return null;
              },
            ),
          ),
          const SizedBox(height: 24),
          AppButton(
            text: "Login",
            onTap: () => _goToMainPage(context),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
