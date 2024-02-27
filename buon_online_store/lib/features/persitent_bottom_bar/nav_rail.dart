import 'package:buon_online_store/constants/constants.dart';
import 'package:buon_online_store/core/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationRailPage extends StatefulWidget {
  static const String routeName = '/nav-rail';
  final User user;
  const NavigationRailPage({Key? key, required this.user}) : super(key: key);

  @override
  State<NavigationRailPage> createState() => _NavigationRailPageState();
}

class _NavigationRailPageState extends State<NavigationRailPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 600;
    final bool isLargeScreen = width > 800;
    final navBar =
        isUserAdmin(widget.user) ? adminNavBarItems : userNavBarItems;

    return Scaffold(
      bottomNavigationBar: isSmallScreen
          ? BottomNavigationBar(
              items: navBar,
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              })
          : null,
      body: Row(
        children: <Widget>[
          if (!isSmallScreen)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              extended: isLargeScreen,
              destinations: navBar
                  .map((item) => NavigationRailDestination(
                      icon: item.icon,
                      selectedIcon: item.activeIcon,
                      label: Text(
                        item.label!,
                      )))
                  .toList(),
            ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
              child: isUserAdmin(widget.user)
                  ? adminscreens(widget.user)[_selectedIndex]
                  : userscreens(widget.user)[_selectedIndex])
        ],
      ),
    );
  }
}
