import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../services/repositories/header_items.dart';

Widget homeScreenEndDrawer(BuildContext context) {
  return Drawer(
    child: SafeArea(
      child: Container(
        color: kPrimaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return headerItems[index].isButton
                ? MouseRegion(
                    //If the item is a button, we add a MouseRegion to make it clickable
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: TextButton(
                        onPressed: headerItems[index].onTap,
                        child: Text(
                          headerItems[index].title,
                          style: const TextStyle(
                            color: kCaptionColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : ListTile(
                    //If the item is not a button, we add a ListTile
                    title: Text(
                      headerItems[index].title,
                      style: const TextStyle(color: kCaptionColor),
                    ),
                    onTap: headerItems[index].onTap,
                  );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10.0,
            );
          },
          itemCount: headerItems.length,
        ),
      ),
    ),
  );
}
