import 'package:buon_online_store/models/app_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';
import '../../../../models/product.dart';

class CustomProductGrid extends StatelessWidget {
  final List<Product> productList;
  final AppUserInfo user;

  const CustomProductGrid({
    super.key,
    required this.productList,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      axisDirection: AxisDirection.down,
      // childAspectRatio: ScreenHelper.isMobile(context) ? 0.75 : 1.2,
      // shrinkWrap: true,
      crossAxisCount: ScreenHelper.isMobile(context) ? 2 : 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      // physics: const NeverScrollableScrollPhysics(),
      children: productList
          .map((e) => ProductCard(
                user: user,
                context: context,
                product: e,
              ))
          .toList(),
    );
  }
}
