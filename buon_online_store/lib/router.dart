import 'package:buon_online_store/features/admin/screens/products_management.dart';
import 'package:buon_online_store/features/persitent_bottom_bar/nav_rail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'features/admin/screens/add_product_form.dart';
import 'features/heropage/screens/catalogue_screen.dart';
import 'features/product/screens/product_page.dart';
import 'models/product.dart';

// list of routing functions

/// HomePage
Future<Object?> navigateToHomepage(BuildContext context, User r) {
  return Navigator.of(context)
      .pushNamed(NavigationRailPage.routeName, arguments: r);
}

/// Catalogue
Future<dynamic> navigateToCatalogueScreen(BuildContext context) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const CatalogueScreen()));
}

/// Single Product Page
void navigateToSingleProductScreen(BuildContext context, Product product) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProductScreen(product)),
  );
}

// Admin routes
//Add Products
void navigateToAddProductForm(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (ctx) => const AddProductForm()));
}

void navigateToProductsManagementScreen(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const ProductsManagementScreen()));
}
