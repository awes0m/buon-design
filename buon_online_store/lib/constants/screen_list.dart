import 'package:buon_online_store/features/cart/cart_screen.dart';
import 'package:buon_online_store/features/admin/admin_screen.dart';
import 'package:buon_online_store/features/heropage/screens/hero_screen.dart';
import 'package:buon_online_store/features/profile/screens/profile_screen.dart';
import 'package:buon_online_store/models/app_user_info.dart';
import 'package:flutter/material.dart';

List<Widget> adminscreens(AppUserInfo user) => [
      WelcomeScreen(user: user),
      ProfileScreen(user: user),
      CartScreen(user),
      AdminScreen(user: user),
    ];

const adminNavBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart_checkout_outlined),
    activeIcon: Icon(Icons.shopping_cart_checkout_rounded),
    label: 'Cart',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.percent_outlined),
    activeIcon: Icon(Icons.percent_sharp),
    label: 'Admin',
  ),
];

List<Widget> userscreens(AppUserInfo user) => [
      WelcomeScreen(user: user),
      ProfileScreen(user: user),
      CartScreen(user),
    ];

const userNavBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart_checkout_outlined),
    activeIcon: Icon(Icons.shopping_cart_checkout_rounded),
    label: 'Cart',
  ),
];
