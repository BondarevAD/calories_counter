import 'package:calories_counter/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class TypePart extends StatelessWidget {
  const TypePart({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      label: "Type:",
      hintText: "",
    );
  }
}
