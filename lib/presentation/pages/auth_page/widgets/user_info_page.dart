import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/presentation/pages/auth_page/cubit/auth_cubit.dart';
import 'package:calories_counter/presentation/pages/auth_page/widgets/app_text_field.dart';
import 'package:calories_counter/presentation/pages/main/main_page.dart';
import 'package:calories_counter/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final GlobalKey<FormState> ageFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> heightFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> weightFormKey = GlobalKey<FormState>();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  Future<void> _goToMainPage(BuildContext context) async {
    // if (nameFormKey.currentState!.validate() &&
    //     phoneFormKey.currentState!.validate()) {
    //   context.navigator.push(
    //     MaterialPageRoute(
    //       builder: (_) => const VerificationPage(),
    //     ),
    //   );
    // }
    await BlocProvider.of<AuthCubit>(context).createNewUser(
      widget.name,
      int.parse(ageController.text),
      int.parse(weightController.text),
      int.parse(heightController.text),
    );
    Get.off(MainPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Enter info about you",
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
            key: ageFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: AppTextField(
              controller: ageController,
              label: "Age",
              hintText: "Enter your full age",
            ),
          ),
          const SizedBox(height: 16),
          Form(
            key: heightFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: AppTextField(
              controller: heightController,
              label: "Height",
              hintText: "Enter your height",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Form(
            key: weightFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: AppTextField(
              controller: weightController,
              label: "Weight",
              hintText: "Enter your weight",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          AppButton(
            text: "Continue",
            onTap: () async => await _goToMainPage(context),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
