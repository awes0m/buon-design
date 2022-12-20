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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: authScreenAppBar,
        // backgroundColor: kPrimaryColor,
        body: ScreenHelper(
            mobile: mobileAuthScreenBuilder(context, size.width),
            tablet: desktopAuthScreenBuilder(context, size.width),
            desktop: desktopAuthScreenBuilder(context, size.width)),
      ),
    );
  }

// Mobile LayoutBuilder
  Widget mobileAuthScreenBuilder(BuildContext context, double width) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [kSecondaryColor, kPrimaryColor],
                  tileMode: TileMode.repeated,
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Welcome to',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: kCaptionColor),
                ),
                logo,

                //SIGN UP
                ListTile(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  tileColor:
                      _auth == Auth.signUp ? kSecondaryColor : kPrimaryColor,
                  title: Text(
                    'Create Account',
                    style: GoogleFonts.satisfy(fontWeight: FontWeight.bold),
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
                    color: kSecondaryColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            hintText: 'Name',
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'E-Mail',
                          ),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                              color: kAuxColor,
                              textColor: Colors.white,
                              text: 'Sign Up',
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) {
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
                  tileColor:
                      _auth == Auth.signIn ? kSecondaryColor : kPrimaryColor,
                  title: Text(
                    'Sign In',
                    style: GoogleFonts.satisfy(fontWeight: FontWeight.bold),
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
                    color: kSecondaryColor,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'E-mail',
                          ),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                              color: kAuxColor,
                              textColor: Colors.white,
                              text: 'Sign In',
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) {
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
                      'Powered by apisod .com',
                      style:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

// Tablet and Desktop
  Widget desktopAuthScreenBuilder(BuildContext context, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.5,
          child: logo,
        ),
        SizedBox(
          width: width * 0.5,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kSecondaryColor, kPrimaryColor],
                        tileMode: TileMode.repeated,
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: kCaptionColor),
                      ),
                      logo,

                      //SIGN UP
                      ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        tileColor: _auth == Auth.signUp
                            ? kSecondaryColor
                            : kPrimaryColor,
                        title: Text(
                          'Create Account',
                          style:
                              GoogleFonts.satisfy(fontWeight: FontWeight.bold),
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
                          color: kSecondaryColor,
                          child: Form(
                            key: _signUpFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: _nameController,
                                  hintText: 'Name',
                                ),
                                CustomTextField(
                                  controller: _emailController,
                                  hintText: 'E-Mail',
                                ),
                                CustomTextField(
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
                            : kPrimaryColor,
                        title: Text(
                          'Sign In',
                          style:
                              GoogleFonts.satisfy(fontWeight: FontWeight.bold),
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
                          color: kSecondaryColor,
                          child: Form(
                            key: _signInFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: _emailController,
                                  hintText: 'E-mail',
                                ),
                                CustomTextField(
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
                            'Powered by apisod .com',
                            style: TextStyle(
                                fontSize: 12, fontStyle: FontStyle.italic),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
