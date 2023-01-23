import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:zeed/data/repo.dart';
import 'package:zeed/models/user.dart';

import '../data/auth_service.dart';

class AppController extends GetxController {
  RxBool loading = false.obs;

  Rx<UserModel?> userModel = UserModel().obs;

  AppRepository appRepository = AppRepository();

  AuthService get _authService => appRepository.authService;

  void setLoading() {
    loading.value = true;
    update();
    print('loading is ${loading.value}');
  }

  void resetLoading() {
    loading.value = false;
    update();
    print('loading is ${loading.value}');
  }

  void setUser(UserModel user) {
    userModel.value = user;
    update();
  }

  Future<void> init() async {
    await appRepository.setup();
  }

  Future<void> verifyPhoneNumber(
      {required String phoneNumber,
      required void Function(PhoneAuthCredential) verificationCompleted,
      required void Function(FirebaseAuthException) verificationFailed,
      required void Function(String, int?) codeSent,
      required void Function(String) codeAutoRetrievalTimeout}) async {
    try {
      await _authService.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<UserModel?> verifyOtp(
      {required String smsCode, required String verificationId}) async {
    try {
      return await _authService.verifyOtp(
          smsCode: smsCode, verificationId: verificationId);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
