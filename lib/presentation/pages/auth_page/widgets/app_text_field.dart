import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? bottomText;
  final TextEditingController? controller;
  final TextStyle? style;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  const AppTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.bottomText,
    this.controller,
    this.style,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bottomLabel = bottomText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        const SizedBox(height: 8),
        TextFormField(
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
          ),
          style: style,
        ),
        if (bottomLabel != null) ...[
          const SizedBox(height: 8),
          Text(
            bottomLabel,
          ),
        ],
      ],
    );
  }
}
