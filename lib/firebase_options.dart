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
    apiKey: 'AIzaSyC_w_fUgDWD-kPpw7O-YP_FAP_ERNlhPBg',
    appId: '1:369071232311:web:01a79f7f646e9893f476b2',
    messagingSenderId: '369071232311',
    projectId: 'restaurant-app-a9f55',
    authDomain: 'restaurant-app-a9f55.firebaseapp.com',
    storageBucket: 'restaurant-app-a9f55.appspot.com',
    measurementId: 'G-5EDQE7WZM3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUjgSVx09hSlDgg662FLW-ag-X2Uf3UBc',
    appId: '1:369071232311:android:2c8a8a3bef1d5f4df476b2',
    messagingSenderId: '369071232311',
    projectId: 'restaurant-app-a9f55',
    storageBucket: 'restaurant-app-a9f55.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmMkDKgukU7rK-e3_vQ8z24z4XF0rnAdA',
    appId: '1:369071232311:ios:538ff783d46f0d45f476b2',
    messagingSenderId: '369071232311',
    projectId: 'restaurant-app-a9f55',
    storageBucket: 'restaurant-app-a9f55.appspot.com',
    iosBundleId: 'com.example.restaurantApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmMkDKgukU7rK-e3_vQ8z24z4XF0rnAdA',
    appId: '1:369071232311:ios:538ff783d46f0d45f476b2',
    messagingSenderId: '369071232311',
    projectId: 'restaurant-app-a9f55',
    storageBucket: 'restaurant-app-a9f55.appspot.com',
    iosBundleId: 'com.example.restaurantApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC_w_fUgDWD-kPpw7O-YP_FAP_ERNlhPBg',
    appId: '1:369071232311:web:573e8048fe9629e7f476b2',
    messagingSenderId: '369071232311',
    projectId: 'restaurant-app-a9f55',
    authDomain: 'restaurant-app-a9f55.firebaseapp.com',
    storageBucket: 'restaurant-app-a9f55.appspot.com',
    measurementId: 'G-WVCCDC7RVV',
  );
}
