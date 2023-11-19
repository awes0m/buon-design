import 'package:buon_online_store/core/enums.dart';
import 'package:flutter/material.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

List<TabPair> tabPairs = Categories.values.map((category) {
  return TabPair(
    tab: Tab(
      text: category.name.toString(),
    ),
    view: Center(
      child: Text(
        category.name.toString(),
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}).toList();
