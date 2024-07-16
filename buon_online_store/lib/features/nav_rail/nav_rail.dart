import 'package:buon_online_store/apis/auth_api.dart';
import 'package:buon_online_store/common/common.dart';
import 'package:buon_online_store/constants/constants.dart';
import 'package:buon_online_store/core/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationRailPage extends ConsumerStatefulWidget {
  static const String routeName = '/nav-rail';
  final User user;
  const NavigationRailPage({super.key, required this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigationRailPageState();
}

class _NavigationRailPageState extends ConsumerState<NavigationRailPage> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    ref.watch(appUserInfoProvider(widget.user.uid)).value;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 600;
    final bool isLargeScreen = width > 800;
    final navBar =
        isUserAdmin(widget.user.uid) ? adminNavBarItems : userNavBarItems;

    return ref.watch(appUserInfoProvider(widget.user.uid)).when(
        data: (appUser) {
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
                    child: isUserAdmin(widget.user.uid)
                        ? adminscreens(appUser!)[_selectedIndex]
                        : userscreens(appUser!)[_selectedIndex])
              ],
            ),
          );
        },
        error: (e, _) => ErrorPage(error: e.toString()),
        loading: () => const LoadingPage());
  }
}
