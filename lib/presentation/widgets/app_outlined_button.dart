import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String? icon;

  const AppOutlinedButton({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFD9D9D9),
          ),
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFFFFFFF),
        ),
        child: Row(
          children: [
            if (icon != null)
              Image.asset(
                icon,
                height: 20,
                width: 20,
              ),
            const SizedBox(width: 4),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
