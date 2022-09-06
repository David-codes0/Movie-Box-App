import 'package:flutter/material.dart';

import 'package:glassmorphism/glassmorphism.dart';
import 'package:vidflix/constants.dart';

void showOTPDialog(
    {required BuildContext context,
    required TextEditingController codeController,
    required VoidCallback onPressed}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            title: const Text('Enter OTP'),
            content: GlassmorphicContainer(
              height: 40,
              width: 30,
              linearGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Constants.kWhiteColor.withOpacity(0.1),
                  Constants.kWhiteColor.withOpacity(0.1),
                ],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Constants.kWhiteColor.withOpacity(0.1),
                  Constants.kWhiteColor.withOpacity(0.1),
                ],
              ),
              border: 3,
              blur: 50,
              borderRadius: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: codeController,
                    decoration: const InputDecoration(hintText: 'phone number'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: onPressed,
                child: const Text('Ok'),
              )
            ],
          ));
}
