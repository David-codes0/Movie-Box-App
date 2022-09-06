import 'package:flutter/material.dart';
import 'package:vidflix/components/custom_page_route.dart';

import 'package:vidflix/main.dart';
import 'package:vidflix/screens/home_screen.dart';
import 'package:vidflix/screens/login_screen.dart';
import 'package:vidflix/screens/movies_detail_screen.dart';
import 'package:vidflix/screens/onboarding_screen.dart';
import 'package:vidflix/screens/register_screen.dart';
import 'package:vidflix/screens/verify_email_screen.dart';

class RoutesManager {
  static const onboardingScreen = '/';

  static const homeScreen = '/homescreen';
  static const loginScreen = '/loginscreen';
  static const registerScreen = '/registerScreen';
  static const movieDetailsScreen = '/movieDetailsScreen';
  static const verifyEmailScreen = '/verifyEmailScreen';
  static const authWrapper = '/authwrapper';
  static const videoPlayerScreen = '/videoplayerscreen';

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return CustomRoutePage(
            child: const HomeScreen(), direction: AxisDirection.left);
      case onboardingScreen:
        return CustomRoutePage(
            child: const OnboardingScreen(), direction: AxisDirection.right);
      case loginScreen:
        return CustomRoutePage(
            child: const LoginScreen(), direction: AxisDirection.right);
      case registerScreen:
        return CustomRoutePage(
            child: const RegisterScreen(), direction: AxisDirection.right);
      // case movieDetailsScreen:
      //   return CustomRoutePage(
      //       child: const MovieDetailsScreen(), direction: AxisDirection.right);

      case verifyEmailScreen:
        return CustomRoutePage(
            child: const VerifyEmailScreen(), direction: AxisDirection.left);
      case authWrapper:
        return CustomRoutePage(
            child: const AuthWrapper(), direction: AxisDirection.left);

      default:
        throw const FormatException('This page could not be found');
    }
  }
}
