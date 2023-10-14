import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  const GlassCard(
      {required this.title,
      required this.subtitle,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: SizedBox(
        width: 125,
        height: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              height: 7.5,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GlassContainer extends StatelessWidget {
  final Widget child;

  const GlassContainer({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          // width: 150.0,
          // height: 100.0,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: .25),
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey.shade200.withOpacity(0.15)),
          child: child,
        ),
      ),
    );
  }
}
