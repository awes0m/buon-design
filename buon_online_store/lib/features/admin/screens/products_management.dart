import 'package:buon_online_store/features/admin/controller/admin_screen_controller.dart';
import 'package:buon_online_store/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/common.dart';

class ProductsManagementScreen extends ConsumerWidget {
  const ProductsManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getAllProductsProvider).when(
        data: (products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                key: ValueKey(products[index].price),
                color: Pallete.backgroundColor,
                elevation: 4,
              );
            },
          );
        },
        error: (error, st) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
