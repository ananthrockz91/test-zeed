// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAufAtgp8pvh5coEnXBXE07LYVCbqB78j0',
    appId: '1:283351177192:web:46dab0bc98764c0e1b765d',
    messagingSenderId: '283351177192',
    projectId: 'zeed-ad45b',
    authDomain: 'zeed-ad45b.firebaseapp.com',
    storageBucket: 'zeed-ad45b.appspot.com',
    measurementId: 'G-QTSVDZ4ZB5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOoNoF0TnZpEPp9zt9nq0glq2_PR4xLRw',
    appId: '1:283351177192:android:980779d9b11295f21b765d',
    messagingSenderId: '283351177192',
    projectId: 'zeed-ad45b',
    storageBucket: 'zeed-ad45b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5B3YmCli_tPUKURW_o6N-_JDHuJSWQBY',
    appId: '1:283351177192:ios:808664bf2e609b6d1b765d',
    messagingSenderId: '283351177192',
    projectId: 'zeed-ad45b',
    storageBucket: 'zeed-ad45b.appspot.com',
    iosClientId:
        '283351177192-eoento186uv9ue90ibh62bvtg2nnp5ph.apps.googleusercontent.com',
    iosBundleId: 'com.example.zeed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5B3YmCli_tPUKURW_o6N-_JDHuJSWQBY',
    appId: '1:283351177192:ios:808664bf2e609b6d1b765d',
    messagingSenderId: '283351177192',
    projectId: 'zeed-ad45b',
    storageBucket: 'zeed-ad45b.appspot.com',
    iosClientId:
        '283351177192-eoento186uv9ue90ibh62bvtg2nnp5ph.apps.googleusercontent.com',
    iosBundleId: 'com.example.zeed',
  );
}