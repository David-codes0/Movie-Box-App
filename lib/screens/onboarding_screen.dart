import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vidflix/components/custom_outline.dart';
import 'dart:developer' as devtools;
import 'package:vidflix/constants.dart';
import 'package:vidflix/routes/routes.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  AnimatedContainer dotIndicator(index) {
    int currentPage = 0;
    return AnimatedContainer(
      margin: const EdgeInsets.only(left: 8),
      duration: const Duration(milliseconds: 400),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color:
            currentPage == index ? Constants.kPinkColor : Constants.kGreyColor,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    devtools.log('${screenWidth * 0.09}   , $screenHeight');
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: screenWidth * 0.146,
              left: -(screenWidth * 0.0081),
              child: Container(
                height: screenWidth * 0.324,
                width: screenWidth * 0.324,
                decoration: const BoxDecoration(
                  color: Constants.kGreenColor,
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: screenWidth * 0.114,
                    sigmaY: screenWidth * 0.114,
                  ),
                  child: SizedBox(
                    height: screenWidth * 0.324,
                    width: screenWidth * 0.324,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenWidth * 0.528,
              right: -screenWidth * 0.081,
              child: Container(
                height: screenWidth * 0.324,
                width: screenWidth * 0.324,
                decoration: const BoxDecoration(
                  color: Constants.kPinkColor,
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: screenWidth * 0.114,
                    sigmaY: screenWidth * 0.114,
                  ),
                  child: SizedBox(
                    height: screenWidth * 0.324,
                    width: screenWidth * 0.324,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenWidth * 0.146,
              left: -(screenWidth * 0.0081),
              child: Container(
                height: screenWidth * 0.324,
                width: screenWidth * 0.324,
                decoration: const BoxDecoration(
                  color: Constants.kGreenColor,
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 70,
                    sigmaY: 70,
                  ),
                  child: SizedBox(
                    height: screenWidth * 0.324,
                    width: screenWidth * 0.324,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 325,
              right: -50,
              child: Container(
                height: screenWidth * 0.324,
                width: screenWidth * 0.324,
                decoration: const BoxDecoration(
                  color: Constants.kPinkColor,
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: screenWidth * 0.114,
                    sigmaY: screenWidth * 0.114,
                  ),
                  child: SizedBox(
                    height: screenWidth * 0.324,
                    width: screenWidth * 0.324,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomOutline(
                      strokeWidth: 4,
                      radius: screenWidth * 0.9,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Constants.kGreenColor,
                            Constants.kGreenColor.withOpacity(0.1),
                            Constants.kPinkColor.withOpacity(0.4),
                            Constants.kPinkColor,
                          ],
                          stops: const [
                            0.2,
                            0.4,
                            0.6,
                            1
                          ]),
                      width: screenWidth * 0.9,
                      height: screenWidth * 0.9,
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img-onboarding.png'),
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomLeft),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Watch Movies in \n   Virtual Reality',
                        style: TextStyle(
                          fontSize: screenWidth * 0.064,
                          color: Constants.kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Download and watch offline\nwherever you are',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.0325,
                          color: Constants.kGreyColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    CustomOutline(
                      strokeWidth: 4,
                      radius: screenWidth * 0.9,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Constants.kGreenColor,
                          Constants.kPinkColor,
                        ],
                      ),
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.07,
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Constants.kGreenColor.withOpacity(0.5),
                                Constants.kPinkColor.withOpacity(0.5),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.registerScreen);
                            },
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: screenWidth * 0.037,
                                    color: Constants.kWhiteColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account.',
                          style: TextStyle(
                            color: Constants.kWhiteColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RoutesManager.loginScreen);
                          },
                          child: const Text(
                            ' Sign in now.',
                            style: TextStyle(
                              color: Constants.kPinkColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          3,
                          (index) => dotIndicator(index),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
