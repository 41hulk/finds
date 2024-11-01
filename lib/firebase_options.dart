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
    apiKey: 'AIzaSyA4JYob6J9qvRiUinIQTO42zWq0s1dAnFw',
    appId: '1:1027437730155:web:e869586b8a8fe9cbd1542e',
    messagingSenderId: '1027437730155',
    projectId: 'finds-b41c3',
    authDomain: 'finds-b41c3.firebaseapp.com',
    storageBucket: 'finds-b41c3.appspot.com',
    measurementId: 'G-Q9H4QZN5JX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1qooPueO6i82mEQg5rGEjghvo4SdQ834',
    appId: '1:1027437730155:android:36de552a2b3c0ad2d1542e',
    messagingSenderId: '1027437730155',
    projectId: 'finds-b41c3',
    storageBucket: 'finds-b41c3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCO5D6kWu9ZMTI7EMsi_zxmvY_wzlHiYR4',
    appId: '1:1027437730155:ios:005783138e3c2f15d1542e',
    messagingSenderId: '1027437730155',
    projectId: 'finds-b41c3',
    storageBucket: 'finds-b41c3.appspot.com',
    iosBundleId: 'com.ntare.finds',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCO5D6kWu9ZMTI7EMsi_zxmvY_wzlHiYR4',
    appId: '1:1027437730155:ios:19306ec7b310dd8dd1542e',
    messagingSenderId: '1027437730155',
    projectId: 'finds-b41c3',
    storageBucket: 'finds-b41c3.appspot.com',
    iosBundleId: 'com.example.finds',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA4JYob6J9qvRiUinIQTO42zWq0s1dAnFw',
    appId: '1:1027437730155:web:b930f88cc56adf98d1542e',
    messagingSenderId: '1027437730155',
    projectId: 'finds-b41c3',
    authDomain: 'finds-b41c3.firebaseapp.com',
    storageBucket: 'finds-b41c3.appspot.com',
    measurementId: 'G-F5HHMGFMEB',
  );
}