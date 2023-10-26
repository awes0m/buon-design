import 'package:buon_online_store/common/logging_service.dart';
import 'package:buon_online_store/features/profile/screens/profile_screen.dart';
import 'package:buon_online_store/features/heropage/screens/hero_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/general_providers.dart';
import '../admin/admin_screen.dart';
import 'persistent_bottom_bar_scaffold.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();
  final _tab4navigatorKey = GlobalKey<NavigatorState>();
  final User user;

  HomePage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: isUserAdmin(user)
          ? [
              PersistentTabItem(
                tab: WelcomeScreen(user: user),
                icon: Icons.home,
                title: 'Home',
                navigatorkey: _tab1navigatorKey,
              ),
              PersistentTabItem(
                tab: const TabPage2(),
                icon: Icons.search,
                title: 'Search',
                navigatorkey: _tab2navigatorKey,
              ),
              PersistentTabItem(
                tab: ProfileScreen(
                  user: user,
                ),
                icon: Icons.person,
                title: 'Profile',
                navigatorkey: _tab3navigatorKey,
              ),
              PersistentTabItem(
                tab: const AdminScreen(),
                icon: Icons.lock,
                title: 'Admin',
                navigatorkey: _tab4navigatorKey,
              ),
            ]
          : [
              PersistentTabItem(
                tab: WelcomeScreen(user: user),
                icon: Icons.home,
                title: 'Home',
                navigatorkey: _tab1navigatorKey,
              ),
              PersistentTabItem(
                tab: const TabPage2(),
                icon: Icons.search,
                title: 'Search',
                navigatorkey: _tab2navigatorKey,
              ),
              PersistentTabItem(
                tab: ProfileScreen(
                  user: user,
                ),
                icon: Icons.person,
                title: 'Profile',
                navigatorkey: _tab3navigatorKey,
              ),
            ],
    );
  }
}

// class TabPage1 extends StatelessWidget {
//   const TabPage1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     LoggingService.logText('TabPage1 build');
//     return Scaffold(
//       appBar: AppBar(title: const Text('Tab 1')),
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Tab 1'),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const Page1('Tab1')));
//                 },
//                 child: const Text('Go to page1'))
//           ],
//         ),
//       ),
//     );
//   }
// }

class TabPage2 extends StatelessWidget {
  const TabPage2({super.key});

  @override
  Widget build(BuildContext context) {
    LoggingService.logText('TabPage2 build');
    return Scaffold(
      appBar: AppBar(title: const Text('Tab 2')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tab 2'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Page2('tab2')));
                },
                child: const Text('Go to page2'))
          ],
        ),
      ),
    );
  }
}

// class TabPage3 extends StatelessWidget {
//   const TabPage3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     LoggingService.logText('TabPage3 build');
//     return Scaffold(
//       appBar: AppBar(title: const Text('Tab 3')),
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Tab 3'),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const Page2('tab3')));
//                 },
//                 child: const Text('Go to page2'))
//           ],
//         ),
//       ),
//     );
//   }
// }

class Page1 extends StatelessWidget {
  final String inTab;

  const Page1(this.inTab, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('in $inTab Page 1'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Page2(inTab)));
                },
                child: const Text('Go to page2'))
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String inTab;

  const Page2(this.inTab, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('in $inTab Page 2'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Page3(inTab)));
                },
                child: const Text('Go to page3'))
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final String inTab;

  const Page3(this.inTab, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('in $inTab Page 3'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Go back'))
          ],
        ),
      ),
    );
  }
}
