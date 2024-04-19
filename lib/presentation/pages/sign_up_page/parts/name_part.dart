import 'package:calories_counter/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class NamePart extends StatelessWidget {
  const NamePart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppTextField(
          label: "",
          hintText: "Name:",
        ),
      ],
    );
  }
}
