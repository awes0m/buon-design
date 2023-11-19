// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:buon_online_store/core/core.dart';
import 'package:buon_online_store/features/heropage/screens/all_products_grid.dart';

import '../../../constants/constants.dart';
import '../../../router.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  final User? user;

  const WelcomeScreen({this.user, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: myTheme.colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CustomPaddings.largeVerticalPadding,
          //Greetings Panel
          Row(
            children: [
              Text(
                "Hi ${widget.user.isDefinedAndNotNull ? widget.user!.displayName : 'There 🫰'}!",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CustomPaddings.mediumVerticalPadding,
          //search bar
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  Text(
                    "Seach our 1000+ products",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          //Hero section
          SizedBox(
            height: ScreenHelper.isMobile(context)
                ? screenWidth / 2
                : screenWidth / 5,
            child: Stack(alignment: Alignment.centerLeft, children: [
              Column(
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 3,
                    child: Card(
                        color: myTheme.primaryColor,
                        child: Container(
                          width: double.infinity,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 16.0, 0, 16.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Main text
                                    const Expanded(
                                      child: FittedBox(
                                          alignment: Alignment.centerLeft,
                                          fit: BoxFit.scaleDown,
                                          child: Padding(
                                              padding: EdgeInsets.all(18.0),
                                              child: Text(
                                                "Cute Lovely \nEnvironmental Friendly",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))),
                                    ),
                                    // Catalog button
                                    ElevatedButton(
                                      onPressed: () {
                                        navigateToCatalogueScreen(context);
                                      },
                                      child: const Text("Catalog",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                      flex: 3,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset('assets/images/hero.svg')),
                    )
                  ],
                ),
              )
            ]),
          ),
          // Trending products
          CustomPaddings.largeVerticalPadding,
          CustomPaddings.largeVerticalPadding,
          //Trending products
          const Row(
            children: [
              Text("Trending Products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.tune)
            ],
          ),

          const AllProductsGrid(),
        ],
      ),
    );
  }
}
