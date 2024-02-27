import 'package:buon_online_store/features/auth/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'common/common.dart';
import 'features/persitent_bottom_bar/nav_rail.dart';
import 'firebase_options.dart';
import 'theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          brightness: Brightness.light,
          primaryTextTheme:
              GoogleFonts.acmeTextTheme(Theme.of(context).primaryTextTheme),
          textTheme: GoogleFonts.dosisTextTheme(Theme.of(context).textTheme),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          brightness: Brightness.dark,
          primaryTextTheme:
              GoogleFonts.acmeTextTheme(Theme.of(context).primaryTextTheme),
          textTheme: GoogleFonts.dosisTextTheme(Theme.of(context).textTheme),
        ),
        title: 'Buon Online Store',
        debugShowCheckedModeBanner: false, //remove debug banner
        themeMode: ref.watch(themeModeProvider), //set theme mode

        builder: (BuildContext context, Widget? child) =>
            ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: <Breakpoint>[
                const Breakpoint(start: 0, end: 480, name: MOBILE), //mobile
                const Breakpoint(start: 481, end: 800, name: TABLET), //tablet
                const Breakpoint(start: 8001, end: 1000, name: TABLET), //tablet
                const Breakpoint(
                    start: 1001, end: 1200, name: DESKTOP), //desktop
                const Breakpoint(start: 12001, end: 2460, name: '4k'), //4k
              ],
            ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final user = snapshot.data;
              if (user == null) {
                return const LoginScreen();
              } else {
                // User is logged in, show the home page
                return NavigationRailPage(
                  user: user,
                );
              }
            }
            return const Loader();
          },
        ));
  }
}
