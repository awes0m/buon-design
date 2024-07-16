import 'package:buon_online_store/common/common.dart';
import 'package:buon_online_store/models/app_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/heroscreen_controller.dart';
import 'widget/custom_product_grid.dart';

class AllProductsGrid extends ConsumerStatefulWidget {
  final AppUserInfo user;
  const AllProductsGrid(
    this.user, {
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CatalogCardsState();
}

class _CatalogCardsState extends ConsumerState<AllProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(getAllProductsProvider).when(
        data: (productList) {
          return CustomProductGrid(
            productList: productList,
            user: widget.user,
          );
        },
        error: (err, st) => ErrorText(error: err.toString()),
        loading: () => const Loader());
  }
}
