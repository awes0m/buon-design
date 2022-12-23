import 'package:buon_ecommerce/utils/globals/globals.dart';
import 'package:buon_ecommerce/utils/globals/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/constants.dart';
import '../services/repositories/header_items.dart';

AppBar homeScreenAppBar(BuildContext context) => AppBar(
      leading: Image.asset('../../../../assets/Buon-black_transparent.png'),
      elevation: 0,
      backgroundColor: kSecondaryColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text("Buon Store",
            style: GoogleFonts.pacifico(
                color: kAuxColor, fontSize: 30, fontWeight: FontWeight.normal)),
      ),
      actions: [
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [Condition.largerThan(name: 'MOBILE')],
          child: Row(
            children: headerItems
                .map((item) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Text(
                            item.title,
                            style: GoogleFonts.raleway(
                              color: kAuxColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        if (ScreenHelper.isMobile(context))
          IconButton(
              onPressed: () =>
                  Globals.scaffoldKey.currentState!.openEndDrawer(),
              padding: const EdgeInsets.only(right: 10.0),
              icon: const Icon(
                Icons.menu,
                color: kAuxColor,
                size: 33,
              )),
        IconButton(
            onPressed: () {},
            padding: const EdgeInsets.only(right: 10.0),
            icon: const Icon(
              Icons.person_4_outlined,
              color: kAuxColor,
              size: 33,
            )),
        IconButton(
            onPressed: () {},
            padding: const EdgeInsets.only(right: 10.0),
            icon: const Icon(
              Icons.search_rounded,
              color: kAuxColor,
              size: 33,
            )),
        IconButton(
          padding: const EdgeInsets.only(right: 10.0),
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_bag_outlined,
            size: 33,
            color: kAuxColor,
          ),
        )
      ],
    );
