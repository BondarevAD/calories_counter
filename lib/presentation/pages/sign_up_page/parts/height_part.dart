import 'package:calories_counter/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class HeightPart extends StatelessWidget {
  const HeightPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      label: "Height:",
      hintText: "",
    );
  }
}
