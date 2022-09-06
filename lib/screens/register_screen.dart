import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:vidflix/components/app_textfield.dart';
import 'package:vidflix/constants.dart';
import 'package:vidflix/screens/login_screen.dart';
import 'package:vidflix/services/firebase_authservice.dart';
import 'package:vidflix/utility/dialogs/loading_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser() async {
    context.read<FirebaseAuthServices>().psignUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          context: context,
        );
    context.read<FirebaseAuthServices>().userBusyCreating
        ? showLoadingDialog(context: context, text: 'Loading...')
        : Container();

    // } else {

    // }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: -60,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Constants.kGreenColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 100,
                      sigmaY: 100,
                    ),
                    child: const SizedBox(
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.4,
                right: -60,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Constants.kPinkColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 100,
                      sigmaY: 100,
                    ),
                    child: const SizedBox(
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: -60,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Constants.kGreenColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 100,
                      sigmaY: 100,
                    ),
                    child: const SizedBox(
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Hi,\nWelcome 👋',
                        style: TextStyle(
                          fontSize: screenWidth * 0.09,
                          color: Constants.kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  GlassmorphicContainer(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.45,
                    borderRadius: 10,
                    linearGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Constants.kWhiteColor.withOpacity(0.1),
                        Constants.kWhiteColor.withOpacity(0.1),
                      ],
                    ),
                    border: 3,
                    blur: 50,
                    borderGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Constants.kWhiteColor.withOpacity(0.1),
                        Constants.kWhiteColor.withOpacity(0.1),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 14.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Constants.kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          AppTextField(
                            obsecure: false,
                            color: Constants.kGreyColor,
                            labelText: 'Please Enter your Email address',
                            controller: emailController,
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 14.0),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Constants.kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          AppTextField(
                            obsecure: true,
                            color: Constants.kGreyColor,
                            labelText: 'Please Enter your password',
                            controller: passwordController,
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          MainCustomButton(
                            color: Colors.white,
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            text: 'Register',
                            size: 0.06,
                            onPressed: signUpUser,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  AlternateSignUpButton(
                    screenWidth: screenWidth,
                    assetName: Constants.kIconGoogle,
                    onPressed: () {},
                    text: 'Google',
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  AlternateSignUpButton(
                    screenWidth: screenWidth,
                    assetName: Constants.kIconFacebook,
                    onPressed: () {},
                    text: 'Facebook',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlternateSignUpButton extends StatelessWidget {
  const AlternateSignUpButton({
    Key? key,
    required this.screenWidth,
    required this.text,
    required this.onPressed,
    required this.assetName,
  }) : super(key: key);

  final double screenWidth;
  final String text;
  final VoidCallback onPressed;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: screenHeight * 0.04,
        width: screenWidth * 0.8,
        child: Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                // alignment: Alignment.centerLeft,
                primary: Constants.kWhiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            onPressed: onPressed,
            icon: Expanded(child: SvgPicture.asset(assetName)),
            label: Text(
              text,
              style: const TextStyle(
                fontSize: 21,
                color: Constants.kBlackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
