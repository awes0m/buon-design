import 'package:flutter/material.dart';

const String cvDownloadUrl =
    "https://drive.google.com/uc?export=download&id=1guzkkKLuTn4C3OQ6bDziQYSMA_oG-vaW";

///Primary App Color
const Color kPrimaryColor = Color.fromRGBO(248, 164, 164, 1);

/// Scaffold Background Color
const Color kSecondaryColor = Color.fromRGBO(255, 249, 245, 1);

/// orange colour
const Color kDangerColor = Color.fromRGBO(115, 119, 123, 1);
const Color kCaptionColor = Color.fromARGB(255, 47, 38, 1);
const Color kAuxColor = Color.fromARGB(255, 77, 25, 25);

const double kDesktopMaxWidth = 1000;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * .8;
}

appSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}
