import 'package:flutter/material.dart';

class CustomTextWhite extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool bold;
  const CustomTextWhite({
    super.key,
    required this.text,
    required this.fontSize,
    required this.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: (bold == true) ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
