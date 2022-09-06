import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:vidflix/routes/routes.dart';
import 'package:vidflix/services/auth_exceptions.dart';
import 'package:vidflix/utility/dialogs/dialogs.dart';
import 'package:vidflix/utility/dialogs/logout_dialog.dart';
import 'package:vidflix/utils/showotpdialog.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethod {
  final FirebaseAuth _auth;

  FirebaseAuthMethod(this._auth);

  User? get user => _auth.currentUser;

  FirebaseAuth get authUser => _auth;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // if (_auth.currentUser != null) {}
      // snackBar(context, 'Account Successfully created');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseAuthException();
      } else {
        throw GenericAuthException();
      }
    }
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message!);
    }
  }

  // Future<void> signInWithFacebook(BuildContext context) async {
  //   try {
  //     LoginResult loginResult = await FacebookAuth.instance.login();

  //     OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //     await _auth.signInWithCredential(facebookAuthCredential);
  //   } on FirebaseAuthException catch (e) {
  //     snackBar(context, e.message!);
  //   }
  // }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null || googleAuth?.idToken != null) {
        // Create a new Credentials
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {}
        }
      }
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message!);
    }
  }

  Future<void> phoneSignIn(String phoneNumber, BuildContext context) async {
    TextEditingController codeController = TextEditingController();
    if (kIsWeb) {
      //  Working on web
      ConfirmationResult result =
          await _auth.signInWithPhoneNumber(phoneNumber);
      showOTPDialog(
          codeController: codeController,
          context: context,
          onPressed: () async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: result.verificationId,
              smsCode: codeController.text.trim(),
            );
            await _auth.signInWithCredential(credential);
            // if (true) {}
            // Navigator.of(context).pop();
          });
    }
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        snackBar(context, e.message!);
      },
      codeSent: ((String verificationId, int? resendToken) async {
        showOTPDialog(
          codeController: codeController,
          context: context,
          onPressed: () async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: codeController.text.trim(),
            );
            await _auth.signInWithCredential(credential);
            if(true){}
            Navigator.of(context).pushNamed(RoutesManager.authWrapper);
          },
        );
      }),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message!);
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message!);
    }
  }
  Future<void> sendPasswordReset({required String toEmail}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: toEmail);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'firebase_auth/invalid-email':
          throw InvalidEmailAuthException();
        case 'firebase_auth/user-not-found':
          throw UserNotFoundAuthException();
        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }
}
