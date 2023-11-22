import 'package:buon_online_store/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:buon_online_store/constants/constants.dart';
import 'package:buon_online_store/core/core.dart';
import 'package:buon_online_store/theme/theme.dart';
import 'package:lottie/lottie.dart';

import '../../../common/common.dart';

enum AuthType { login, signup }

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var authType = AuthType.login;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Center(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                //'Welcome to Buon 🫰'
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 1 : 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppLargetext(
                        text: 'Welcome to Buon 🫰',
                        size: ScreenHelper.isMobile(context) ? 40 : 50,
                      ),
                      verticalGap(5),
                      //'Cutest gift store that ever existed 💕 '
                      const AppText(
                        text: 'Cutest gift store that ever existed 💕 ',
                        size: 20,
                      ),
                      verticalGap(),
                      //animation
                      Container(
                        height: ScreenHelper.isDesktop(context)
                            ? size.height * .45
                            : size.height * .25,
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
                ),
                // Sign in to continue
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 1 : 3,
                  child: ListView(
                    children: [
                      verticalGap(ScreenHelper.isMobile(context)
                          ? 10
                          : size.height / 2 - 100),
                      // Sign in form
                      SizedBox(
                        height: 25,
                        width: 200,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                  onPressed: () =>
                                      setState(() => authType = AuthType.login),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: authType == AuthType.login
                                        ? Pallete.textColor
                                        : Pallete.backgroundColor,
                                  ),
                                  child: Text('Login',
                                      style: TextStyle(
                                        color: authType == AuthType.login
                                            ? Pallete.whiteColor
                                            : Pallete.textColor,
                                      ))),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: authType == AuthType.signup
                                        ? Pallete.textColor
                                        : Pallete.backgroundColor,
                                  ),
                                  onPressed: () => setState(
                                      () => authType = AuthType.signup),
                                  child: Text('Signup',
                                      style: TextStyle(
                                        color: authType == AuthType.signup
                                            ? Pallete.whiteColor
                                            : Pallete.textColor,
                                      ))),
                            ]),
                      ),
                      Container(
                        constraints: const BoxConstraints(
                            maxHeight: 300, minHeight: 150),
                        child: Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (authType == AuthType.signup)
                                    //name
                                    CustomTextField(
                                        height: ScreenHelper.isMobile(context)
                                            ? 50
                                            : null,
                                        controller: nameController,
                                        hintText: 'Goodname!'),
                                  //email
                                  CustomTextField(
                                      height: ScreenHelper.isMobile(context)
                                          ? 50
                                          : null,
                                      controller: emailController,
                                      hintText: 'Email'),
                                  // password
                                  CustomTextField(
                                      height: ScreenHelper.isMobile(context)
                                          ? 50
                                          : null,
                                      controller: passwordController,
                                      hintText: 'Password',
                                      obscureText: true),
                                  verticalGap(),
                                  CustomButton(
                                      size: Size(size.width / 2 - 20, 35),
                                      text: authType.name.toTitleCase(),
                                      onTap: () {})
                                ],
                              ),
                            )),
                      ),
                      verticalGap(),
                      // Social buttons
                      SizedBox(
                        height: 50,
                        child: Row(
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
                      ),
                      verticalGap(20),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
