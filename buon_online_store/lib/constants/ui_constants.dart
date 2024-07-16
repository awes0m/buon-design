import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import '../theme/theme.dart';
import 'asset_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        // color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static List<Widget> bottomTabBarPages = <Widget>[
    // const TweetList(),
    const Text('Search Screen'),
    const Text('Notification screen')
  ];
}

const double kDesktopMaxWidth = 1000;
const double kTabletMaxWidth = 760.0;

enum ThemePref { light, dark }

SizedBox verticalGap([double height = 10]) => SizedBox(height: height);
SizedBox horizontalGap([double width = 10]) => SizedBox(width: width);

class CustomPaddings {
  static Padding get largeVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 32.0));

  static Padding get mediumVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 16.0));

  static Padding get smallVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 8.0));

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blueGrey,
      ).copyWith(
        cardTheme: const CardTheme(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(0.0),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(
                const Color(0xFFBAE5D4).withOpacity(0.5)), // Button color
            foregroundColor: WidgetStateProperty.all<Color>(
                Colors.white), // Text and icon color
          ),
        ),
      );
}
