import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAuxColor,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.location_pin, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                'Delivering To ',
                style: GoogleFonts.raleway(color: Colors.white),
              ),
              Text(
                'Gorushree: ',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
          Text(
            'addess of gorushree',
            style: GoogleFonts.raleway(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    );
  }
}
