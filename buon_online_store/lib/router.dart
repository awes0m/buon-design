import 'package:buon_online_store/features/admin/screens/products_management.dart';
import 'package:buon_online_store/features/auth/screens/login_screen.dart';
import 'package:buon_online_store/features/nav_rail/nav_rail.dart';
import 'package:buon_online_store/models/app_user_info.dart';
import 'package:flutter/material.dart';

import 'features/admin/screens/add_product_form.dart';
import 'features/product/screens/product_page.dart';
import 'models/product.dart';

// list of routing functions
//AuthPage
Future<Object?> navigateToAuth(BuildContext context) {
  return Navigator.of(context).pushNamed(
    LoginScreen.routeName,
  );
}

/// HomePage
Future<Object?> navigateToHomepage(BuildContext context, AppUserInfo? r) {
  return Navigator.of(context)
      .pushReplacementNamed(NavigationRailPage.routeName, arguments: r);
}

/// Single Product Page
void navigateToSingleProductScreen(
    BuildContext context, Product product, AppUserInfo user) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProductScreen(product, user)),
  );
}

// Admin routes
//Add Products
void navigateToAddProductForm(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (ctx) => const AddProductForm()));
}

void navigateToProductsManagementScreen(
    BuildContext context, AppUserInfo user) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => ProductsManagementScreen(user)));
}
