import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'features/home/screen/homescreen.dart';
import 'firebase_options.dart';
import 'router.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buon Ecom',
      debugShowCheckedModeBanner: false, //remove debug banner
      themeMode: ThemeMode.dark, //set theme mode
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android, //set platform
        scaffoldBackgroundColor: kSecondaryColor,
        primaryColor: kPrimaryColor,
        canvasColor: kSecondaryColor,
        textTheme: GoogleFonts.latoTextTheme(), //set text theme
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE), //mobile
          const ResponsiveBreakpoint.resize(800, name: TABLET), //tablet
          const ResponsiveBreakpoint.resize(1000, name: TABLET), //tablet
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP), //desktop
          const ResponsiveBreakpoint.resize(2460, name: "4k"), //4k
        ],
        background: Container(
          //set background color
          color: kSecondaryColor,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      initialRoute: HomeScreen.routeName,
      // navigatorKey: Globals.navigatorKey,

      //set home page
    );
  }
}
