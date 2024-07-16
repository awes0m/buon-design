import 'package:buon_online_store/features/admin/controller/admin_screen_controller.dart';
import 'package:buon_online_store/features/heropage/screens/widget/custom_product_grid.dart';
import 'package:buon_online_store/models/app_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/common.dart';

class ProductsManagementScreen extends ConsumerWidget {
  final AppUserInfo user;
  const ProductsManagementScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getAllProductsProvider).when(
        data: (products) {
          return Scaffold(
              appBar: AppBar(title: const Text('Manage Products')),
              body: CustomProductGrid(
                productList: products,
                user: user,
              ));
        },
        error: (error, st) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
