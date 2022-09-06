import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vidflix/constants.dart';
import 'package:vidflix/routes/routes.dart';
import 'package:vidflix/screens/login_screen.dart';
import 'package:vidflix/services/firebase_authservice.dart';
import 'package:vidflix/utility/dialogs/loading_dialog.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  void verifyEmail() {
    context.read<FirebaseAuthServices>().psendEmailVerification(context);
    context.read<FirebaseAuthServices>().emailSent
        ? showLoadingDialog(context: context, text: 'Loading...')
        : Container();

    // devtools.log(
    //   context.read<FirebaseAuthServices>().emailSent.toString(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verify Email',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
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
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.6,
                    height: screenWidth * 0.6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Constants.kGreenColor,
                          Constants.kGreenColor.withOpacity(0.1),
                          Constants.kPinkColor.withOpacity(0.4),
                          Constants.kPinkColor,
                        ],
                        stops: const [0.2, 0.4, 0.6, 1],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.email_sharp,
                        size: screenHeight * 0.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Please check your mail\n to verify your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Constants.kGreyColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  MainCustomButton(
                    screenWidth: screenWidth * 0.9,
                    screenHeight: screenHeight * 1,
                    text: 'Verify Email',
                    size: 0.04,
                    onPressed: verifyEmail, color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
