import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.location_pin),
              SizedBox(width: 10),
              Text('Delivering To '),
              Text(
                'Gorushree',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Text(
            'addess of gorushree',
            style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
