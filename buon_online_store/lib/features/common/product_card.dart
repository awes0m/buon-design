// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buon_online_store/features/product/screens/product_page.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../core/core.dart';
import '../../models/custom_product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.context,
    required this.product,
  }) : super(key: key);

  final BuildContext context;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductScreen(product)),
        );
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: ScreenHelper.isMobile(context) ? 3 : 8,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(product.imageUrls[0]),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(product.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(product.description,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                    CustomPaddings.smallVerticalPadding,
                    Text(
                      product.price.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
