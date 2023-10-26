// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class TopBarFb4 extends StatelessWidget {
  final String title;
  final String upperTitle;
  final IconData icon;
  final VoidCallback onTap;
  const TopBarFb4({
    Key? key,
    required this.title,
    required this.upperTitle,
    this.icon = Icons.menu,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(icon),
            onPressed: onTap,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
              Text(upperTitle,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
    );
  }
}
