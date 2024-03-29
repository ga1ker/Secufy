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
    apiKey: 'AIzaSyDSpTDH1ISoqtjI5NRi0_IOLh4KZ1Dc4xM',
    appId: '1:743492029148:web:f54cc43393c86dbce60219',
    messagingSenderId: '743492029148',
    projectId: 'secufy-31c90',
    authDomain: 'secufy-31c90.firebaseapp.com',
    databaseURL: 'https://secufy-31c90-default-rtdb.firebaseio.com',
    storageBucket: 'secufy-31c90.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEoz3H3pTYSflGF-g7cLcP2m2Q0bczRZA',
    appId: '1:743492029148:android:459e41d0d4106c26e60219',
    messagingSenderId: '743492029148',
    projectId: 'secufy-31c90',
    databaseURL: 'https://secufy-31c90-default-rtdb.firebaseio.com',
    storageBucket: 'secufy-31c90.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7tlgbYL558irpqjye0nb1Yla1ePRZSic',
    appId: '1:743492029148:ios:a436db2edfbe9c10e60219',
    messagingSenderId: '743492029148',
    projectId: 'secufy-31c90',
    databaseURL: 'https://secufy-31c90-default-rtdb.firebaseio.com',
    storageBucket: 'secufy-31c90.appspot.com',
    iosClientId: '743492029148-b0ji61msmpef4hon2jaqtftr0vg6t9m5.apps.googleusercontent.com',
    iosBundleId: 'com.example.secufyApp',
  );
}
