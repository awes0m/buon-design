import 'package:buon_ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget get logo => RichText(
      text: TextSpan(
          text: 'Buon',
          style: GoogleFonts.pacifico(color: kAuxColor, fontSize: 30),
          children: const [
            TextSpan(text: ' store', style: TextStyle(fontSize: 18)),
          ]),
    );
