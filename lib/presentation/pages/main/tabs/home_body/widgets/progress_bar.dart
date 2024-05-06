import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.color, required this.height});

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        height: 90,
        width: 40,
        child: Padding(
          padding: EdgeInsets.only(
            top: height,
            bottom: 8.0,
          ),
          child: Align(
            child: Container(
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
