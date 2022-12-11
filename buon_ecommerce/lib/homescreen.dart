import 'package:buon_ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text("Buon Store",
                style: GoogleFonts.pacifico(color: Colors.white, fontSize: 33)),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
