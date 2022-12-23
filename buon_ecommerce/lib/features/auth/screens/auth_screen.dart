import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/logo.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../utils/constants.dart';
import '../../../utils/globals/screen_helper.dart';
import '../services/auth_service.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // DEFAULTS
  late Auth _auth = Auth.signUp;
  // STATES
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void googleSignIn() {
    authService.googleSignIn(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: authScreenAppBar,
        // backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: ScreenHelper(
              mobile: responsiveAuthScreenBuilder(context, size.width),
              tablet: responsiveAuthScreenBuilder(context, size.width),
              desktop: responsiveAuthScreenBuilder(context, size.width)),
        ),
      ),
    );
  }

// mobile,Tablet and Desktop
  Widget responsiveAuthScreenBuilder(BuildContext context, double width) {
    return Stack(
      alignment: !ScreenHelper.isMobile(context)
          ? Alignment.center
          : Alignment.topCenter,
      children: [
        //BackGround Gradient
        Container(
          height: getMobileMaxHeight(context),
          width: getMaxWidth(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              tileMode: TileMode.decal,
              colors: [kPrimaryColor.withOpacity(0.1), kSecondaryColor],
              begin: !ScreenHelper.isMobile(context)
                  ? Alignment.centerRight
                  : Alignment.topCenter,
              end: !ScreenHelper.isMobile(context)
                  ? Alignment.centerLeft
                  : Alignment.bottomCenter,
            ),
          ),
        ),
        // Logo and text components
        Flex(
          direction:
              ScreenHelper.isMobile(context) ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            !ScreenHelper.isMobile(context)
                ? const SizedBox.shrink()
                : const SizedBox(height: 20),
            Image.asset(
              '../../../../assets/Buon-black_transparent.png',
              color: kAuxColor,
              colorBlendMode: BlendMode.srcIn,
              height: ScreenHelper.isMobile(context)
                  ? getMobileMaxHeight(context) * 0.3
                  : getMobileMaxHeight(context) * 0.45,
            ),
            !ScreenHelper.isMobile(context)
                ? const SizedBox(width: 150)
                : const SizedBox.shrink(),
            SizedBox(
              width:
                  !ScreenHelper.isMobile(context) ? width * 0.5 : width * 0.9,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: !ScreenHelper.isMobile(context)
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Welcome !',
                            style: GoogleFonts.raleway(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: kAuxColor),
                          ),

                          //SIGN UP
                          ListTile(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            tileColor: _auth == Auth.signUp
                                ? kSecondaryColor
                                : Colors.transparent,
                            title: Text(
                              'Create Account',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Radio(
                                activeColor: kAuxColor,
                                value: Auth.signUp,
                                groupValue: _auth,
                                onChanged: (Auth? val) {
                                  setState(() {
                                    _auth = val!;
                                  });
                                }),
                          ),
                          if (_auth == Auth.signUp)
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.transparent,
                              child: Form(
                                key: _signUpFormKey,
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      borderColor: kPrimaryColor,
                                      controller: _nameController,
                                      hintText: 'Name',
                                    ),
                                    CustomTextField(
                                      borderColor: kPrimaryColor,
                                      controller: _emailController,
                                      hintText: 'E-Mail',
                                    ),
                                    CustomTextField(
                                      borderColor: kPrimaryColor,
                                      controller: _passwordController,
                                      hintText: 'Password',
                                    ),
                                    const SizedBox(height: 10),
                                    CustomButton(
                                        color: kAuxColor,
                                        textColor: Colors.white,
                                        text: 'Sign Up',
                                        onTap: () {
                                          if (_signUpFormKey.currentState!
                                              .validate()) {
                                            signUpUser();
                                          }
                                        })
                                  ],
                                ),
                              ),
                            ),
                          //SIGN IN
                          ListTile(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            tileColor: _auth == Auth.signIn
                                ? kSecondaryColor
                                : Colors.transparent,
                            title: Text(
                              'Sign In',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Radio(
                                activeColor: kAuxColor,
                                value: Auth.signIn,
                                groupValue: _auth,
                                onChanged: (Auth? val) {
                                  setState(() {
                                    _auth = val!;
                                  });
                                }),
                          ),
                          if (_auth == Auth.signIn)
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.transparent,
                              child: Form(
                                key: _signInFormKey,
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      borderColor: kPrimaryColor,
                                      controller: _emailController,
                                      hintText: 'E-mail',
                                    ),
                                    CustomTextField(
                                      borderColor: kPrimaryColor,
                                      controller: _passwordController,
                                      hintText: 'Password',
                                    ),
                                    const SizedBox(height: 10),
                                    CustomButton(
                                        color: kAuxColor,
                                        textColor: Colors.white,
                                        text: 'Sign In',
                                        onTap: () {
                                          if (_signInFormKey.currentState!
                                              .validate()) {
                                            signInUser();
                                          }
                                        })
                                  ],
                                ),
                              ),
                            ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Social Sign In',
                                style: TextStyle(
                                    fontSize: 12, fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  iconSize: 40,
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => kPrimaryColor)),
                                  onPressed: googleSignIn,
                                  tooltip: "Sign in With Gmail",
                                  icon: Icon(Icons.g_mobiledata)),
                              IconButton(
                                  iconSize: 30,
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => kPrimaryColor)),
                                  onPressed: () {},
                                  tooltip: "Sign in With Facebook",
                                  icon: Icon(Icons.facebook)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
