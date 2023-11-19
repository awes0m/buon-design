import 'package:buon_online_store/core/enums.dart';
import 'package:buon_online_store/features/heropage/controller/heroscreen_controller.dart';
import 'package:buon_online_store/features/heropage/screens/widget/custom_product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/common.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

List<TabPair> tabPairs = Categories.values.map((category) {
  return TabPair(
    tab: Tab(
      text: category.name.toString(),
    ),
    view: Center(
        child: CatalogueTabList(
      [category],
    )),
  );
}).toList();

class CatalogueTabList extends ConsumerStatefulWidget {
  final List<Categories> categories;
  const CatalogueTabList(this.categories, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CatalogueTabListState();
}

class _CatalogueTabListState extends ConsumerState<CatalogueTabList> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(categoryfilteredProductsProvider(widget.categories)).when(
        data: (productsList) {
          return CustomProductGrid(
            productList: productsList,
          );
        },
        error: (err, st) => ErrorText(error: err.toString()),
        loading: () => const Loader());
  }
}
