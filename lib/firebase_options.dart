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
    apiKey: 'AIzaSyCND6OAyE8AB-DdcY0UIDgU7qPXdYk7uEU',
    appId: '1:937572872170:web:5993177f307aaf30d58c93',
    messagingSenderId: '937572872170',
    projectId: 'mr-bean-9227c',
    authDomain: 'mr-bean-9227c.firebaseapp.com',
    storageBucket: 'mr-bean-9227c.appspot.com',
    measurementId: 'G-LD24ZT78BP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAc3_2kdRW7mquKZ1GPZYYLWcmIoXR6hUM',
    appId: '1:937572872170:android:c24344f299a6ffc7d58c93',
    messagingSenderId: '937572872170',
    projectId: 'mr-bean-9227c',
    storageBucket: 'mr-bean-9227c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaDWkdNLbwf2KKPkZjZijBZSzJwbhpNxM',
    appId: '1:937572872170:ios:f21dd8d8d0617012d58c93',
    messagingSenderId: '937572872170',
    projectId: 'mr-bean-9227c',
    storageBucket: 'mr-bean-9227c.appspot.com',
    iosClientId: '937572872170-7dtel3m29pq8hi81me6n8anch48dvs82.apps.googleusercontent.com',
    iosBundleId: 'com.example.mrbean',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaDWkdNLbwf2KKPkZjZijBZSzJwbhpNxM',
    appId: '1:937572872170:ios:c7141eb40c1009f8d58c93',
    messagingSenderId: '937572872170',
    projectId: 'mr-bean-9227c',
    storageBucket: 'mr-bean-9227c.appspot.com',
    iosClientId: '937572872170-hr2ok845tqsf2u1tg3d3ekr8eac55a9r.apps.googleusercontent.com',
    iosBundleId: 'com.example.mrbean.RunnerTests',
  );
}