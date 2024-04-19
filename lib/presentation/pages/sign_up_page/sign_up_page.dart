import 'package:calories_counter/presentation/pages/sign_up_page/parts/height_part.dart';
import 'package:calories_counter/presentation/pages/sign_up_page/parts/name_part.dart';
import 'package:calories_counter/presentation/pages/sign_up_page/parts/type_part.dart';
import 'package:calories_counter/presentation/pages/sign_up_page/parts/weight_part.dart';
import 'package:calories_counter/presentation/utils/sign_up_parts.dart';
import 'package:calories_counter/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpParts part = SignUpParts.name;

  void goNextPart() {
    switch (part) {
      case SignUpParts.name:
        setState(() {
          part = SignUpParts.height;
        });
      case SignUpParts.height:
        setState(() {
          part = SignUpParts.weight;
        });
      case SignUpParts.weight:
        setState(() {
          part = SignUpParts.type;
        });
      case SignUpParts.type:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.close,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _body,
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: _buttonNext,
      ),
    );
  }

  Widget get _body {
    switch (part) {
      case SignUpParts.name:
        return const NamePart();
      case SignUpParts.height:
        return const HeightPart();
      case SignUpParts.weight:
        return const WeightPart();
      case SignUpParts.type:
        return const TypePart();
    }
  }

  Widget get _buttonNext {
    return AppButton(
      text: "Next",
      onTap: goNextPart,
    );
  }
}
