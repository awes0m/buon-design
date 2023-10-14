import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.width,
    this.maxLines = 1,
    this.borderColor = Colors.black,
    this.validator,
    this.onPressed,
    this.textfieldButtonName,
    this.keyboardType,
  });
  final TextEditingController controller;
  final String hintText;
  final double? width;
  final int maxLines;
  final Color borderColor;
  final String? Function(String?)? validator;
  final VoidCallback? onPressed;
  final String? textfieldButtonName;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: onPressed.isNull
                ? null
                : TextButton(
                    onPressed: onPressed,
                    child: Text(textfieldButtonName ?? 'restore')),
            filled: true,
            fillColor: Colors.white,
            labelText: hintText,
            labelStyle: GoogleFonts.raleway(),
            hintText: hintText,
            hintStyle: GoogleFonts.raleway(),
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black38,
            )),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: borderColor,
                ))),
        validator: validator ??
            (String? val) {
              if (val == null || val.isEmpty) {
                return 'Enter your $hintText';
              }
              return null;
            },
        maxLines: maxLines,
      ),
    );
  }
}
