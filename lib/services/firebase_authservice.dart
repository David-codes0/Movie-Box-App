import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:vidflix/routes/routes.dart';
import 'package:vidflix/services/auth_exceptions.dart';
import 'package:vidflix/services/firebase_auth_methods.dart';
import 'package:vidflix/utility/dialogs/dialogs.dart';
import 'package:vidflix/utility/dialogs/error_dialog.dart';

class FirebaseAuthServices with ChangeNotifier {
  FirebaseAuth? _auth;
   var _indexClicked = 0;
  bool _otpSent = false;
  bool _userBusyCreating = false;
  bool _emailSent = false;
  int get indexClicked => _indexClicked;
  bool get otpSent => _otpSent;
  bool get userBusyCreating => _userBusyCreating;
  bool get emailSent => _emailSent;

  void pageClicked(int pagesIndex) {
    _indexClicked = pagesIndex;
    notifyListeners();
  }

  Future<void> phoneSigI(String phoneNumber, BuildContext context) async {
    _otpSent = true;
    notifyListeners();
    try {
      notifyListeners();
      await FirebaseAuthMethod(FirebaseAuth.instance)
          .phoneSignIn(phoneNumber, context);
      await Future.delayed(const Duration(seconds: 4));
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message!);
    }
    _otpSent = false;
    notifyListeners();
  }

  Future<void> psignUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _userBusyCreating = true;
    notifyListeners();
    try {
      await FirebaseAuthMethod(FirebaseAuth.instance).signUp(
        context: context,
        email: email,
        password: password,
      );

      if (FirebaseAuthMethod(FirebaseAuth.instance).user != null) {}

      Navigator.of(context).popAndPushNamed(RoutesManager.verifyEmailScreen);
    } on WeakPasswordAuthException {
      Navigator.pop(context);
      await showErrorDialog(
        context,
        'Weak Password',
      );
    } on InvalidEmailAuthException {
      Navigator.pop(context);
      await showErrorDialog(
        context,
        'Invalid Email',
      );
    } on EmailAlreadyInUseAuthException {
      Navigator.pop(context);
      await showErrorDialog(
        context,
        'Email already in use',
      );
    } on GenericAuthException {
      Navigator.pop(context);
      await showErrorDialog(context, 'Authentication Error');
    }
  }

  Future<void> ploginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _userBusyCreating = true;
    notifyListeners();
    try {
      await FirebaseAuthMethod(FirebaseAuth.instance)
          .loginWithEmail(email: email, password: password, context: context);

      if (!FirebaseAuthMethod(FirebaseAuth.instance).user!.emailVerified) {
        if (true) {}
        Navigator.of(context).popAndPushNamed(RoutesManager.verifyEmailScreen);
        snackBar(context, 'Please Verified Email');
      } else {
        if (true) {}
        Navigator.of(context).popAndPushNamed(RoutesManager.authWrapper);
        snackBar(context, 'Login Successfully');
      }
    } on UserNotFoundAuthException {
      Navigator.pop(context);
      await showErrorDialog(
        context,
        'User not found',
      );
    } on WrongPasswordAuthException {
      Navigator.pop(context);
      await showErrorDialog(
        context,
        'Wrong Password',
      );
    } on GenericAuthException {
      Navigator.pop(context);
      await showErrorDialog(context, 'Authentication Error');
    }

    _userBusyCreating = false;
    notifyListeners();
  }

  Future<void> psendEmailVerification(BuildContext context) async {
    _emailSent = true;
    notifyListeners();
    try {
      await FirebaseAuthMethod(FirebaseAuth.instance)
          .user!
          .sendEmailVerification();
      if (_auth?.currentUser != null) {}
      Navigator.pop(context);
      showErrorDialog(context, 'Email Verification sent');

      // await Future.delayed(const Duration(seconds: 4), () {});
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message!);
    }
    _emailSent = false;
    notifyListeners();
  }

  Future<void> psendPasswordReset({
    required String email,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuthMethod(FirebaseAuth.instance)
          .sendPasswordReset(toEmail: email);
    } on InvalidEmailAuthException {
      await showErrorDialog(
        context,
        'Invalid Email',
      );
    } on UserNotFoundAuthException {
      await showErrorDialog(
        context,
        'User not found',
      );
    } on GenericAuthException {
      Navigator.pop(context);
      await showErrorDialog(context, 'Authentication Error');
    }
  }
}
