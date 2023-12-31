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
    apiKey: 'AIzaSyDjRjfTKfvJBeB_hfIdIZB9ik0lTfxO-M8',
    appId: '1:764524112245:web:9b860ff49744e46bcf0b3c',
    messagingSenderId: '764524112245',
    projectId: 'call-doc-v1',
    authDomain: 'call-doc-v1.firebaseapp.com',
    storageBucket: 'call-doc-v1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvbRBq6L5eHT56_yzTQZamOXktUEV8aeo',
    appId: '1:764524112245:android:8916d5925569c1b5cf0b3c',
    messagingSenderId: '764524112245',
    projectId: 'call-doc-v1',
    storageBucket: 'call-doc-v1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFWyeTKN1dMJnErvvBR--sH6S5o9HL4_w',
    appId: '1:764524112245:ios:32ab8b1958bdf5d5cf0b3c',
    messagingSenderId: '764524112245',
    projectId: 'call-doc-v1',
    storageBucket: 'call-doc-v1.appspot.com',
    iosBundleId: 'com.example.callDoc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFWyeTKN1dMJnErvvBR--sH6S5o9HL4_w',
    appId: '1:764524112245:ios:644ec8bef37c246dcf0b3c',
    messagingSenderId: '764524112245',
    projectId: 'call-doc-v1',
    storageBucket: 'call-doc-v1.appspot.com',
    iosBundleId: 'com.example.callDoc.RunnerTests',
  );
}
