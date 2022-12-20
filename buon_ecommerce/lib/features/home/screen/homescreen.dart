// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:buon_ecommerce/utils/constants.dart';
import 'package:buon_ecommerce/utils/globals/screen_helper.dart';

import '../widgets/address_bar.dart';
import '../widgets/catagories_widget.dart';
import '../widgets/main_carousel.dart';
import '../widgets/tagline.dart';

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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_sharp,
                    size: 33,
                  )),
            )
          ],
        ),
        body: ScreenHelper(
          mobile: buildMobile(context, getMaxWidth(context)),
          tablet: buildDesktop(context, getMaxWidth(context)),
          desktop: buildDesktop(context, getMaxWidth(context)),
        ),
      ),
    );
  }
}

// mobilebuild view

Widget buildMobile(context, double width) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AddressBar(),
        MainCarousel(width: width),
        const TagLine(),
        MainCarousel(width: width),
        const CategoriesWidget(),
      ],
    ),
  );
}

// desktopbuild View

Widget buildDesktop(context, double width) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const AddressBar(),
        MainCarousel(width: width),
        const TagLine(),
        MainCarousel(width: width),
        const CategoriesWidget(),
      ],
    ),
  );
}
