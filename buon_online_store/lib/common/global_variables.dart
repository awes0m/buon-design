import 'package:flutter/material.dart';

class GlobalVariables {
  // COLORS
  static const LinearGradient kAppBarGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(250, 214, 165, 1),
      Color.fromRGBO(207, 185, 151, 1),
    ],
    stops: <double>[0.5, 1.0],
  );
  static const LinearGradient lighterBarGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(250, 214, 165, 0.5),
      Color.fromRGBO(207, 185, 151, 0.5),
    ],
    stops: <double>[0.5, 1.0],
  );

  static const Color backgroundColor = Color.fromRGBO(239, 245, 245, 1);
  static const Color greyBackgroundCOlor = Color.fromARGB(255, 238, 237, 222);
  static const Color kLightOrange = Color.fromRGBO(248, 164, 164, 1);

  // STATIC IMAGES
  static const List<String> carouselImages = <String>[
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];
}
