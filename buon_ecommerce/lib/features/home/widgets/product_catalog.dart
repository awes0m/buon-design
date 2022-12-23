import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/globals/screen_helper.dart';

class ProductCatalogLeftImage extends StatelessWidget {
  const ProductCatalogLeftImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction:
          !ScreenHelper.isMobile(context) ? Axis.horizontal : Axis.vertical,
      children: [
        SizedBox(
          width: !ScreenHelper.isMobile(context)
              ? getMaxWidth(context) * 0.98 / 2
              : getMaxWidth(context) * 0.98,
          child: Image.network(
              'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80'),
        ),
        SizedBox(
          height: ScreenHelper.isMobile(context) ? 20 : 0,
          width: ScreenHelper.isMobile(context) ? 20 : 0,
        ),
        SizedBox(
          width: !ScreenHelper.isMobile(context)
              ? getMaxWidth(context) * 0.98 / 2
              : getMaxWidth(context) * 0.98,
          child: const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in "),
        )
      ],
    );
  }
}
