import 'package:buon_online_store/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:buon_online_store/constants/constants.dart';
import 'package:buon_online_store/core/core.dart';
import 'package:buon_online_store/src/src.dart';
import 'package:buon_online_store/theme/theme.dart';

import '../../../common/common.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppLargetext(
                text: 'Welcome to Buon 🫰',
                size: 50,
              ),
              verticalGap(),
              const AppText(
                text: 'Cutest gift store that ever existed 💕 ',
                size: 20,
              ),
              verticalGap(20),
              Container(
                height: ScreenHelper.isDesktop(context)
                    ? size.height * .45
                    : size.height * .5,
                width: ScreenHelper.isDesktop(context)
                    ? size.width * .25
                    : size.width * .5,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                ),
                child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (ctx, index, _) {
                      return SvgPicture.asset(
                        'assets/images/signUpcarousel_${index + 1}.svg',
                        fit: BoxFit.contain,
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlayCurve: Curves.slowMiddle,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                    )),
              ),
              verticalGap(20),
              appText(
                  '-------------------------- Sign in  -------------------------'),
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
              )
            ]),
      ),
    );
  }
}
