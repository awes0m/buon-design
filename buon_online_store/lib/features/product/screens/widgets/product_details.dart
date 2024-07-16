import 'package:buon_online_store/common/app_large_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils.dart';
import '../../../../models/product.dart';
import '../theme/product_page_theme.dart';

class ProductDetailsMobile extends StatefulWidget {
  const ProductDetailsMobile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDetailsMobile> createState() => _ProductDetailsMobileState();
}

class _ProductDetailsMobileState extends State<ProductDetailsMobile> {
  final DraggableScrollableController controller =
      DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      controller: controller,
      snapSizes: const [0.3, 0.4, 0.5, 0.65, 0.9],
      initialChildSize: 0.4,
      minChildSize: 0.3,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32.0))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              controller: scrollController,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: ProductPageTheme.grey.withOpacity(0.5),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(1.0))),
                    height: 4,
                    width: 48,
                  ),
                ),
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
                        style: TextStyle(
                            fontSize: 16, color: ProductPageTheme.grey)),
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
      },
    );
  }
}
