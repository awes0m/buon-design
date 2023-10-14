import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AppLargetext extends StatelessWidget {
  const AppLargetext(
      {super.key,
      this.size = 30,
      required this.text,
      this.color = Pallete.textColor});
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
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
