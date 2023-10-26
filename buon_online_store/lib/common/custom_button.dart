import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.textColor,
    required this.onTap,
    this.color,
  }) : super(key: key);
  final String text;
  final Color? textColor;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
      ),
      child: Text(text,
          style: (textColor != null)
              ? GoogleFonts.acme(
                  fontWeight: FontWeight.bold,
                  color: textColor ?? Theme.of(context).colorScheme.onPrimary)
              : Theme.of(context).primaryTextTheme.labelLarge
          //   style: GoogleFonts.acme(
          //       fontWeight: FontWeight.bold,
          //       color: textColor ?? Theme.of(context).colorScheme.onPrimary),
          ),
    );
  }
}
