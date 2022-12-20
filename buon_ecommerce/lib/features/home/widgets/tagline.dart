import 'package:buon_ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class TagLine extends StatelessWidget {
  const TagLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Text(
          'Tag Line-Line of Tags',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
