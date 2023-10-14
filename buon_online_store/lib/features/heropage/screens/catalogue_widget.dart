import 'package:buon_online_store/common/common.dart';
import 'package:buon_online_store/features/common/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../controller/heroscreen_controller.dart';

class CatalogCards extends ConsumerStatefulWidget {
  const CatalogCards({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CatalogCardsState();
}

class _CatalogCardsState extends ConsumerState<CatalogCards> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(getAllProductsProvider).when(
        data: (productList) {
          return GridView.count(
            childAspectRatio: ScreenHelper.isMobile(context) ? 0.75 : 1.2,
            shrinkWrap: true,
            crossAxisCount: ScreenHelper.isMobile(context) ? 2 : 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            physics: const NeverScrollableScrollPhysics(),
            children: productList
                .map((e) => ProductCard(
                      context: context,
                      product: e,
                    ))
                .toList(),
          );
        },
        error: (err, st) => ErrorText(error: err.toString()),
        loading: () => const Loader());
  }
}
