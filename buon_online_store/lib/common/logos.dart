import 'package:flutter/material.dart';

class AppLogos {
  static Widget fullTextLogo(BuildContext context, double height) =>
      Image.asset(
        'assets/logos/text_full_logo.png',

        height: height,
        color: Theme.of(context).colorScheme.primary,
        // colorBlendMode: BlendMode.overlay,
      );

  static Widget shortTextLogo(BuildContext context, double height) =>
      Image.asset(
        'assets/logos/text_logo.png',
        // colorBlendMode: BlendMode.overlay,
        height: height,
        color: Theme.of(context).colorScheme.primary,
      );

  static Widget shortLogo(BuildContext context, double height) =>
      Image.asset('assets/logos/logo_short.png',
          // colorBlendMode: BlendMode.overlay,
          height: height,
          color: Theme.of(context).colorScheme.primary);

  static Widget fullLogo(BuildContext context, double height) =>
      Image.asset('assets/logos/full_logo.png',
          // colorBlendMode: BlendMode.overlay,
          height: height,
          color: Theme.of(context).colorScheme.primary);
}
