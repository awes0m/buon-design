import 'package:buon_online_store/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:buon_online_store/constants/constants.dart';
import 'package:buon_online_store/core/core.dart';
import 'package:buon_online_store/theme/theme.dart';
import 'package:lottie/lottie.dart';

import '../../../common/common.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                //'Welcome to Buon 🫰'
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLargetext(
                      text: 'Welcome to Buon 🫰',
                      size: 50,
                    ),
                    verticalGap(),
                    //'Cutest gift store that ever existed 💕 '
                    const AppText(
                      text: 'Cutest gift store that ever existed 💕 ',
                      size: 20,
                    ),
                    verticalGap(20),
                    //animation
                    Container(
                      height: ScreenHelper.isDesktop(context)
                          ? size.height * .45
                          : size.height * .5,
                      width: ScreenHelper.isDesktop(context)
                          ? size.width * .25
                          : size.width * .5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3)),
                      ),
                      child: Lottie.asset('assets/animations/welcome.json',
                          frameRate: FrameRate(2),
                          repeat: true,
                          reverse: true,
                          onLoaded: (composition) {}),
                    ),
                  ],
                ),
                ScreenHelper.isMobile(context)
                    ? const SizedBox.shrink()
                    : horizontalGap(700),
                // Sign in to continue
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScreenHelper.isMobile(context)
                        ? const SizedBox.shrink()
                        : verticalGap(500),
                    appText(
                      'Sign in to continue',
                    ),
                    verticalGap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //google
                        SocialButtons(
                            iconData: FontAwesomeIcons.google,
                            onpressed: () => ref
                                .watch(authControllerProvider.notifier)
                                .signinWithGoogle(context)),
                        horizontalGap(),
                        SocialButtons(
                            iconData: FontAwesomeIcons.facebook,
                            onpressed: () => () => ref
                                .watch(authControllerProvider.notifier)
                                .signinWithFacebook(context)),

                        horizontalGap(),
                        SocialButtons(
                            iconData: FontAwesomeIcons.twitter,
                            onpressed: () => ref
                                .watch(authControllerProvider.notifier)
                                .signinWithTwitter(context)),

                        horizontalGap(),
                        SocialButtons(
                            iconData: FontAwesomeIcons.apple,
                            onpressed: () => ref
                                .watch(authControllerProvider.notifier)
                                .signinWithApple(context)),
                      ],
                    ),
                    verticalGap(20),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
