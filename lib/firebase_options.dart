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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBenwPHqIFKVgoHO4efVukO2lW-gWMk5SE',
    appId: '1:755876996800:android:da8a8716e690999bf92f25',
    messagingSenderId: '755876996800',
    projectId: 'telephone-directory-app-34571',
    databaseURL: 'https://telephone-directory-app-34571-default-rtdb.firebaseio.com',
    storageBucket: 'telephone-directory-app-34571.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVql32kDDTPu0bmuMa7dqvvKJyXcyri6s',
    appId: '1:755876996800:ios:c8426f494b05fe56f92f25',
    messagingSenderId: '755876996800',
    projectId: 'telephone-directory-app-34571',
    databaseURL: 'https://telephone-directory-app-34571-default-rtdb.firebaseio.com',
    storageBucket: 'telephone-directory-app-34571.appspot.com',
    iosBundleId: 'com.example.telephoneDirectoryAppFirebase',
  );
}
