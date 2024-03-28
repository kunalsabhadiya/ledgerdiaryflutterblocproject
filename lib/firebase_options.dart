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
    apiKey: 'AIzaSyDQCHFyVhXvN6pMldl4sBUu69zyYG-W4Dk',
    appId: '1:320586509411:web:fa475d3c558189116fdc56',
    messagingSenderId: '320586509411',
    projectId: 'ledgerdiary-75cc1',
    authDomain: 'ledgerdiary-75cc1.firebaseapp.com',
    storageBucket: 'ledgerdiary-75cc1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKozRX-S-hndLVYvS4IN3iRlltZ6b5peI',
    appId: '1:320586509411:android:6faddccb31b396ad6fdc56',
    messagingSenderId: '320586509411',
    projectId: 'ledgerdiary-75cc1',
    storageBucket: 'ledgerdiary-75cc1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1AMZK1Jxkguv5DJusXaECsIHlWRFjw1A',
    appId: '1:320586509411:ios:e368fe29518eea136fdc56',
    messagingSenderId: '320586509411',
    projectId: 'ledgerdiary-75cc1',
    storageBucket: 'ledgerdiary-75cc1.appspot.com',
    iosBundleId: 'com.nsv.ledgerdiary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1AMZK1Jxkguv5DJusXaECsIHlWRFjw1A',
    appId: '1:320586509411:ios:961e2aea20d256b56fdc56',
    messagingSenderId: '320586509411',
    projectId: 'ledgerdiary-75cc1',
    storageBucket: 'ledgerdiary-75cc1.appspot.com',
    iosBundleId: 'com.nsv.ledgerdiary.RunnerTests',
  );
}