import 'package:buon_online_store/core/general_providers.dart';
import 'package:buon_online_store/features/product/screens/widgets/product_details_desktop.dart';
import 'package:buon_online_store/models/app_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/core.dart';
import '../../../models/product.dart';
import 'theme/product_page_theme.dart';
import 'widgets/product_details.dart';
import 'widgets/product_display_image.dart';

class ProductScreen extends ConsumerStatefulWidget {
  final AppUserInfo user;
  final Product product;
  const ProductScreen(
    this.product,
    this.user, {
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var mobileView = Stack(
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
        ProductDetailsMobile(product: widget.product),
      ],
    );
    var desktopView = Stack(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          flex: 50, // percent of screen for image
          child: Center(
            child: ProductDisplayImage(product: widget.product),
          ),
        ),
        Expanded(
            flex: 70, child: ProductDetailsDesktop(product: widget.product)),
      ]),
    ]);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        mini: !ScreenHelper.isDesktop(context),
        tooltip: 'Add to cart',
        child: Container(
            constraints: BoxConstraints.loose(const Size(100, 50)),
            child: const Icon(FontAwesomeIcons.bagShopping)),
      ),
      backgroundColor: ProductPageTheme.courseCardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: ProductPageTheme.catalogueButtonColor),
        actions: isUserAdmin(widget.user.uid)
            ? [
                IconButton.filled(
                    onPressed: () {}, icon: const Icon(FontAwesomeIcons.pen))
              ]
            : null,
      ),
      body: ScreenHelper(
        desktop: desktopView,
        tablet: desktopView,
        mobile: mobileView,
      ),
    );
  }
}
