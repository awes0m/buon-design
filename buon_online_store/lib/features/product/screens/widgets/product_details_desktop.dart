import 'package:buon_online_store/common/app_large_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils.dart';
import '../../../../models/product.dart';
import '../theme/product_page_theme.dart';

class ProductDetailsDesktop extends StatefulWidget {
  const ProductDetailsDesktop({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDetailsDesktop> createState() => _ProductDetailsDesktopState();
}

class _ProductDetailsDesktopState extends State<ProductDetailsDesktop> {
  final DraggableScrollableController controller =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.0))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ProductPageTheme.mediumVerticalPadding,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Name

                AppLargetext(
                  text: widget.product.name,
                ),
                //Price

                Text(
                    "Price: starts from ₹ ${widget.product.price.toStringAsFixed(1)} ",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            ProductPageTheme.largeVerticalPadding,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Customizable
                Text(
                    widget.product.isCustom
                        ? "Customizable"
                        : "Standard Product",
                    style:
                        TextStyle(fontSize: 16, color: ProductPageTheme.grey)),
              ],
            ),
            ProductPageTheme.mediumVerticalPadding,
            appText(
              widget.product.description.length > 10
                  ? widget.product.description
                  : "Learn the basics of lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            ),
            ProductPageTheme.mediumVerticalPadding,
            const Row(
              children: [Spacer(flex: 2), Spacer(flex: 2)],
            )
          ],
        ),
      ),
    );
  }
}
