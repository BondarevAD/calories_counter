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
    apiKey: 'AIzaSyCrLwWsllRKFDh6Xt3CbNUYDYpXbrxoShE',
    appId: '1:496950293079:android:d60836c420a43fbc79e912',
    messagingSenderId: '496950293079',
    projectId: 'calorie-501cb',
    storageBucket: 'calorie-501cb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLw2czRgOY_jI4PnwHQbc0Vfd8xvhpA6s',
    appId: '1:496950293079:ios:1d50660bd9a02afc79e912',
    messagingSenderId: '496950293079',
    projectId: 'calorie-501cb',
    storageBucket: 'calorie-501cb.appspot.com',
    androidClientId: '496950293079-gi2lqmmgk3km3trm8snt1oh3cdugcrg0.apps.googleusercontent.com',
    iosClientId: '496950293079-0fb90tutvjg2e11biv1f91h4q8p4avi8.apps.googleusercontent.com',
    iosBundleId: 'com.example.caloriesCounter',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA60GuZfNtezNHLVbQNk2uRreJGen1r4ak',
    appId: '1:496950293079:web:08fc6cc54c71373f79e912',
    messagingSenderId: '496950293079',
    projectId: 'calorie-501cb',
    authDomain: 'calorie-501cb.firebaseapp.com',
    storageBucket: 'calorie-501cb.appspot.com',
  );

}