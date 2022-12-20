import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../services/repositories/carousel_items.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 75.0,
              height: 75.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? kAuxColor
                      : kPrimaryColor)
                  // .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
              child: const Icon(Icons.abc),
            ),
          );
        }).toList(),
      ),
    );
  }
}
