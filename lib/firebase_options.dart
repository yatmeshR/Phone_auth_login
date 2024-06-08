// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDDYVB8-QzwwPS8zxBT__5CHp8sVZuZgTE',
    appId: '1:323311198553:web:24e7ce2bb97647958dac48',
    messagingSenderId: '323311198553',
    projectId: 'dits-nexcom',
    authDomain: 'dits-nexcom.firebaseapp.com',
    storageBucket: 'dits-nexcom.appspot.com',
    measurementId: 'G-KYDM7E1X4X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIdWQZ6Qa1sr-3ZwQRQ6hk_ApVXDZPbo4',
    appId: '1:323311198553:android:75e98a07104782598dac48',
    messagingSenderId: '323311198553',
    projectId: 'dits-nexcom',
    storageBucket: 'dits-nexcom.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5fbGqnUTCBqapEc36HpX1L7kvPlEt5hM',
    appId: '1:323311198553:ios:3cec1bf348bc4cee8dac48',
    messagingSenderId: '323311198553',
    projectId: 'dits-nexcom',
    storageBucket: 'dits-nexcom.appspot.com',
    iosBundleId: 'com.example.ditsNexcom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5fbGqnUTCBqapEc36HpX1L7kvPlEt5hM',
    appId: '1:323311198553:ios:3cec1bf348bc4cee8dac48',
    messagingSenderId: '323311198553',
    projectId: 'dits-nexcom',
    storageBucket: 'dits-nexcom.appspot.com',
    iosBundleId: 'com.example.ditsNexcom',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDDYVB8-QzwwPS8zxBT__5CHp8sVZuZgTE',
    appId: '1:323311198553:web:5f9fdc39c8fba8b18dac48',
    messagingSenderId: '323311198553',
    projectId: 'dits-nexcom',
    authDomain: 'dits-nexcom.firebaseapp.com',
    storageBucket: 'dits-nexcom.appspot.com',
    measurementId: 'G-5LK4BGXBPF',
  );
}
