import 'package:buon_online_store/features/heropage/screens/catalogue_widget.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  static const routeName = '/catalog-screen';
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All our Offerings'),
      ),
      body: const CatalogCards(),
    );
  }
}
