// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/globals/globals.dart';
import '../../../utils/globals/screen_helper.dart';
import '../services/repositories/header_items.dart';
import '../widgets/address_bar.dart';
import '../widgets/catagories_widget.dart';
import '../widgets/end_drawer.dart';
import '../widgets/app_bar.dart';
import '../widgets/main_carousel.dart';
import '../widgets/product_catalog.dart';
import '../widgets/tagline.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: Globals.scaffoldKey,
        drawerEnableOpenDragGesture:
            !ScreenHelper.isMobile(context) ? false : true,
        backgroundColor: kSecondaryColor,
        endDrawer: homeScreenEndDrawer(context),
        appBar: homeScreenAppBar(context),
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
        MainCarousel(width: width), //TODO: Add BestSelling products Carousel
        const CategoriesWidget(),
        const ProductCatalogLeftImage()
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
        MainCarousel(width: width), //TODO: Add BestSelling products Carousel
        const CategoriesWidget(),
        const ProductCatalogLeftImage()
      ],
    ),
  );
}
