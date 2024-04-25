import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final Function(String) onChanged;

  const SearchTextField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: const Color(0xFF979797),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
