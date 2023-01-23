import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:zeed/core/app_service.dart';
import 'package:zeed/models/user.dart';

class AuthService extends AppService {
  late FirebaseAuth _firebaseAuth;

  @override
  Future<void> init() async {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<void> verifyPhoneNumber(
      {required String phoneNumber,
      required void Function(PhoneAuthCredential) verificationCompleted,
      required void Function(FirebaseAuthException) verificationFailed,
      required void Function(String, int?) codeSent,
      required void Function(String) codeAutoRetrievalTimeout}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
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
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final UserModel userModel = UserModel((b) => b
        ..uid = userCredential.user?.uid
        ..phoneNumber = userCredential.user?.phoneNumber
        ..displayName = userCredential.user?.displayName
        ..email = userCredential.user?.email);

      return userModel;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  @override
  Future<void> dispose() async {}
}
