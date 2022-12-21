// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:buon_ecommerce/utils/constants.dart';
import 'package:buon_ecommerce/utils/globals/screen_helper.dart';

import '../widgets/address_bar.dart';
// import '../widgets/catagories_widget.dart';
// import '../widgets/main_carousel.dart';
// import '../widgets/tagline.dart';

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
        // MainCarousel(width: width),
        // const TagLine(),
        // MainCarousel(width: width), //TODO: Add BestSelling products Carousel
        // const CategoriesWidget(),
        Flex(
          direction:
              !ScreenHelper.isMobile(context) ? Axis.horizontal : Axis.vertical,
          children: [
            SizedBox(
              width: !ScreenHelper.isMobile(context)
                  ? getMaxWidth(context) * 0.98 / 2
                  : getMaxWidth(context) * 0.98,
              child: Image.network(
                  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80'),
            )
          ],
        )
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
        // MainCarousel(width: width),
        // const TagLine(),
        // MainCarousel(width: width), //TODO: Add BestSelling products Carousel
        // const CategoriesWidget(),
        Flex(
          direction:
              !ScreenHelper.isMobile(context) ? Axis.horizontal : Axis.vertical,
          children: [
            SizedBox(
              width: !ScreenHelper.isMobile(context)
                  ? getMaxWidth(context) * 0.98 / 2
                  : getMaxWidth(context) * 0.98,
              child: Image.network(
                  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80'),
            ),
            SizedBox(
              height: ScreenHelper.isMobile(context) ? 20 : 0,
              width: ScreenHelper.isMobile(context) ? 20 : 0,
            ),
            SizedBox(
              width: !ScreenHelper.isMobile(context)
                  ? getMaxWidth(context) * 0.98 / 2
                  : getMaxWidth(context) * 0.98,
              child: const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in "),
            )
          ],
        )
      ],
    ),
  );
}
