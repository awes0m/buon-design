//reusable app button
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'app_text.dart';

class AppSquareButton extends StatelessWidget {
  AppSquareButton({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
    this.text = 'Enter',
    this.icon,
  });
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  bool isIcon;
  String? text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: isIcon
          ? Center(
              child: Icon(
                icon,
                color: color,
              ),
            )
          : Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            ),
    );
  }
}
