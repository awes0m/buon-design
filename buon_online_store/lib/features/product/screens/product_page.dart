import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/core.dart';
import '../../../models/product.dart';
import 'widgets/product_display_image.dart';
import 'widgets/product_details.dart';
import 'theme/product_page_theme.dart';

class ProductScreen extends ConsumerStatefulWidget {
  final Product product;

  const ProductScreen(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //  => Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => CustomizeProductForm(widget.product))),
        mini: !ScreenHelper.isDesktop(context),
        tooltip: 'Customize your order',
        child: Container(
            constraints: BoxConstraints.loose(const Size(100, 50)),
            child: const Icon(FontAwesomeIcons.bagShopping)),
      ),
      backgroundColor: ProductPageTheme.courseCardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: ProductPageTheme.catalogueButtonColor),
      ),
      body: Stack(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 70, // percent of screen for image
              child: Center(
                child: ProductDisplayImage(product: widget.product),
              ),
            ),
            const Spacer(flex: 50) // percent of screen for text
          ]),
          ProductDetails(product: widget.product),
        ],
      ),
    );
  }
}
