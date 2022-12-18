import 'package:buon_ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget authScreenAppBar = PreferredSize(
  preferredSize: const Size.fromHeight(50),
  child: AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          // gradient: GlobalVariables.appBarGradient,
          color: kSecondaryColor),
    ),
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          'Hello Adventurer !',
          style: GoogleFonts.caveat(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    ]),
  ),
);
