import 'package:calories_counter/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class WeightPart extends StatelessWidget {
  const WeightPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      label: "Weight:",
      hintText: "",
    );
  }
}
