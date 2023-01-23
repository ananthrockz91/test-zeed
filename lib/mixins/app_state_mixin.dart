import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeed/controllers/app_controller.dart';

import '../models/user.dart';
import '../views/home.dart';
import '../views/verify_otp_page.dart';

mixin AppControllerMixin<T extends StatefulWidget> on State<T> {
  static final Rx<AppController> _appController = AppController().obs;

  AppController appController = _appController.value;

  void updateAppState(Function(AppController s) update) {
    _appController.update((s) => update(s!));
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      appController.setLoading();
      await appController.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential p) {},
          verificationFailed: (FirebaseAuthException e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error verification phone number'),
              ),
            );
          },
          codeSent: (String verificationId, int? code) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => VerifyOtpPage(
                          verificationId: verificationId,
                        )));
            appController.resetLoading();
          },
          codeAutoRetrievalTimeout: (v) {});
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      appController.resetLoading();
    }
  }

  Future<void> verifyOtp(
      {required String smsCode, required verificationId}) async {
    appController.setLoading();

    try {
      appController.setLoading();
      var user = await appController.verifyOtp(
          smsCode: smsCode, verificationId: verificationId);

      goToHomePage(user);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void goToHomePage(UserModel? user) {
    if (user != null) {
      appController.setUser(user);
      appController.resetLoading();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => const MyHomePage()),
          (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error verifying OTP!'),
        ),
      );
    }
  }
}
