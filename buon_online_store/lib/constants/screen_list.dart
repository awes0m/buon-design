import 'package:buon_online_store/cart/cart_screen.dart';
import 'package:buon_online_store/features/admin/admin_screen.dart';
import 'package:buon_online_store/features/heropage/screens/hero_screen.dart';
import 'package:buon_online_store/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

List<Widget> adminscreens(user) => [
      const WelcomeScreen(),
      ProfileScreen(user: user),
      const CartScreen(),
      const AdminScreen(),
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

List<Widget> userscreens(user) => [
      const WelcomeScreen(),
      ProfileScreen(user: user),
      const CartScreen(),
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
