import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final Color borderColor;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.borderColor = Colors.black,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
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
                  style: BorderStyle.solid,
                  color: borderColor,
                ))),
        validator: (val) {
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
