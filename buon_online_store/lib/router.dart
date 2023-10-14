import 'package:buon_online_store/features/heropage/screens/catalogue_screen.dart';
import 'package:buon_online_store/features/persitent_bottom_bar/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    // case AuthScreen.routeName:
    //   return MaterialPageRoute<dynamic>(
    //       settings: routeSettings, builder: (_) => const AuthScreen());
    // case EmailVerificationScreen.routeName:
    //   return MaterialPageRoute<dynamic>(
    //       settings: routeSettings,
    //       builder: (_) => const EmailVerificationScreen());
    case HomePage.routeName:
      final User user = routeSettings.arguments! as User;
      return MaterialPageRoute<dynamic>(
          settings: routeSettings, builder: (_) => HomePage(user));

    // case AddTripScreen.routeName:
    //   return MaterialPageRoute<dynamic>(
    //       settings: routeSettings, builder: (_) => const AddTripScreen());

    // case SellerPlansEditorScreen.routeName:
    //   return MaterialPageRoute<dynamic>(
    //       settings: routeSettings,
    //       builder: (_) => const SellerPlansEditorScreen());
    case CatalogueScreen.routeName:
      return MaterialPageRoute<dynamic>(
          settings: routeSettings, builder: (_) => const CatalogueScreen());

    default:
      return MaterialPageRoute<dynamic>(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Error 404, Page doesen't Exist"),
          ),
        ),
      );
  }
}
