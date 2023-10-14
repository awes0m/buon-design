import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      this.size = 16,
      required this.text,
      this.color = Colors.black54});
  final double size;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
