import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget get logo => RichText(
      text: TextSpan(
          text: 'Buon',
          style: GoogleFonts.satisfy(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          children: const [
            TextSpan(text: ' store', style: TextStyle(fontSize: 18)),
          ]),
    );
