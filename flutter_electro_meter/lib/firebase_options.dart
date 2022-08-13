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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDjwRbpQosP-Cdp8JRtBPV74KZ1VwaH6Jo',
    appId: '1:188217343538:web:87ed905332162ad822062b',
    messagingSenderId: '188217343538',
    projectId: 'electrometer2',
    authDomain: 'electrometer2.firebaseapp.com',
    databaseURL: 'https://electrometer2-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'electrometer2.appspot.com',
    measurementId: 'G-N3W437QRKN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6xjij1QwwRzaFCvaiA6cZ8ZWISPlC6vg',
    appId: '1:188217343538:android:074a89a2b587927c22062b',
    messagingSenderId: '188217343538',
    projectId: 'electrometer2',
    databaseURL: 'https://electrometer2-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'electrometer2.appspot.com',
  );
}