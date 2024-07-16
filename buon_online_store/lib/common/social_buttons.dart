import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtons extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onpressed;
  const SocialButtons({
    super.key,
    this.iconData = FontAwesomeIcons.a,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: IconButton.filled(
        iconSize: 30,
        onPressed: onpressed,
        icon: Icon(iconData),
      ),
    );
  }
}
