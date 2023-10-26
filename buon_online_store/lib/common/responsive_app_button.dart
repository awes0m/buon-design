import 'package:flutter/material.dart';
import '../core/core.dart';

import 'app_text.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton(
      {super.key,
      this.width,
      this.isResponsive = false,
      this.text = 'Book Now'});
  final bool isResponsive;
  final double? width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? getMaxWidth(context) : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 8),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: <Widget>[
            if (isResponsive)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AppText(text: text, color: Colors.white),
              )
            else
              Container(),
            Image.asset('assets/img/button-one.png'),
          ],
        ),
      ),
    );
  }
}
