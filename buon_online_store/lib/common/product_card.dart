import 'package:buon_online_store/models/app_user_info.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../core/core.dart';
import '../models/product.dart';
import '../router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.context,
    required this.product,
    required this.user,
  });

  final BuildContext context;
  final Product product;
  final AppUserInfo user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => navigateToSingleProductScreen(context, product, user),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints(
              maxWidth: ScreenHelper.isMobile(context)
                  ? size.width / 2 - 20
                  : size.width / 4 - 20,
              maxHeight: 280),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 8, // ScreenHelper.isMobile(context) ? 3 : 8,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                  child: Image(
                    fit: BoxFit.contain,
                    image: CachedNetworkImageProvider(product.imageUrls[0]),
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
                      Text(
                          product.isCustom
                              ? 'Customizable'
                              : 'Standard Product',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                      CustomPaddings.smallVerticalPadding,
                      Text(
                        'Starting only at Rs ${product.price.toString()}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
