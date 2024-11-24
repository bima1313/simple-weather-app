import 'package:flutter/material.dart';

class CustomTextBlack extends StatelessWidget {
  final String text;
  final double fontSize;
  const CustomTextBlack({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
