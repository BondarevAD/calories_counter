import 'package:calories_counter/presentation/pages/auth_page/cubit/auth_cubit.dart';
import 'package:calories_counter/presentation/pages/auth_page/widgets/app_text_field.dart';
import 'package:calories_counter/presentation/pages/auth_page/widgets/user_info_page.dart';
import 'package:calories_counter/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> _goToVerification(BuildContext context) async {
    // if (nameFormKey.currentState!.validate() &&
    //     phoneFormKey.currentState!.validate()) {
    //   context.navigator.push(
    //     MaterialPageRoute(
    //       builder: (_) => const VerificationPage(),
    //     ),
    //   );
    // }

    await BlocProvider.of<AuthCubit>(context).createAccount(
      phoneController.text,
      passwordController.text,
    );
    Get.to(UserInfoPage(
      name: nameController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Create account",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            "Number",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "",
          ),
          const SizedBox(height: 24),
          Form(
            key: nameFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: AppTextField(
              controller: nameController,
              label: "Name",
              hintText: "Enter your full name",
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return "Too short name";
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          Form(
            key: phoneFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: AppTextField(
              controller: phoneController,
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
            text: "Continue",
            onTap: () => _goToVerification(context),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
