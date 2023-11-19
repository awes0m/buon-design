// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:buon_online_store/features/auth/screens/login_screen.dart';
import 'package:buon_online_store/features/heropage/screens/catalogue_screen.dart';
import 'package:buon_online_store/features/heropage/screens/hero_screen.dart';
import 'package:buon_online_store/features/profile/screens/profile_screen.dart';

import '../../core/general_providers.dart';
import '../admin/admin_screen.dart';
import 'persistent_bottom_bar_scaffold.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();
  final _tab4navigatorKey = GlobalKey<NavigatorState>();
  final User? user;

  HomePage([
    Key? key,
    this.user,
  ]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (user.isDefinedAndNotNull && isUserAdmin(user!)) {
      return PersistentBottomBarScaffold(
        items: [
          PersistentTabItem(
            tab: WelcomeScreen(user: user!),
            icon: Icons.home,
            title: 'Home',
            navigatorkey: _tab1navigatorKey,
          ),
          PersistentTabItem(
            tab: const CatalogueScreen(),
            icon: FontAwesomeIcons.productHunt,
            title: 'Catlogue',
            navigatorkey: _tab2navigatorKey,
          ),
          PersistentTabItem(
            tab: ProfileScreen(
              user: user!,
            ),
            icon: Icons.person,
            title: 'Profile',
            navigatorkey: _tab3navigatorKey,
          ),
          PersistentTabItem(
            tab: const AdminScreen(),
            icon: Icons.lock,
            title: 'Admin',
            navigatorkey: _tab4navigatorKey,
          ),
        ],
      );
    } else if (user.isDefinedAndNotNull && !isUserAdmin(user!)) {
      return PersistentBottomBarScaffold(items: [
        PersistentTabItem(
          tab: WelcomeScreen(user: user!),
          icon: Icons.home,
          title: 'Home',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: const CatalogueScreen(),
          icon: FontAwesomeIcons.productHunt,
          title: 'Catlogue',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: ProfileScreen(
            user: user!,
          ),
          icon: Icons.person,
          title: 'Profile',
          navigatorkey: _tab3navigatorKey,
        ),
      ]);
    } else {
      return PersistentBottomBarScaffold(
        items: [
          PersistentTabItem(
            tab: const WelcomeScreen(),
            icon: Icons.home,
            title: 'Home',
            navigatorkey: _tab1navigatorKey,
          ),
          PersistentTabItem(
            tab: const CatalogueScreen(),
            icon: FontAwesomeIcons.productHunt,
            title: 'Catlogue',
            navigatorkey: _tab2navigatorKey,
          ),
          PersistentTabItem(
            tab: const LoginScreen(),
            icon: Icons.login,
            title: 'Login',
            navigatorkey: _tab3navigatorKey,
          ),
        ],
      );
    }
  }
}
