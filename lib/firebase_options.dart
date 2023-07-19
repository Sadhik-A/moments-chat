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
    apiKey: 'AIzaSyDhqIkdJDXWmnwaquZpmlzl7NrxCSiw4-w',
    appId: '1:501405946968:web:b8c941a1f8eba5875d662d',
    messagingSenderId: '501405946968',
    projectId: 'moments-5e85c',
    authDomain: 'moments-5e85c.firebaseapp.com',
    storageBucket: 'moments-5e85c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6YbrhmLCZVttNyx61CW-uMRLECw7sCUw',
    appId: '1:501405946968:android:b61684ec12e7ea765d662d',
    messagingSenderId: '501405946968',
    projectId: 'moments-5e85c',
    storageBucket: 'moments-5e85c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwAp0_oMrTeFX0sMa_XcGmMwO861s7rUM',
    appId: '1:501405946968:ios:5c2c63e7817099ea5d662d',
    messagingSenderId: '501405946968',
    projectId: 'moments-5e85c',
    storageBucket: 'moments-5e85c.appspot.com',
    iosClientId: '501405946968-pqt1p1ng5r7ql2pgqip45uc92hj51j7e.apps.googleusercontent.com',
    iosBundleId: 'com.example.moments',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwAp0_oMrTeFX0sMa_XcGmMwO861s7rUM',
    appId: '1:501405946968:ios:04856c7c8e20b4c65d662d',
    messagingSenderId: '501405946968',
    projectId: 'moments-5e85c',
    storageBucket: 'moments-5e85c.appspot.com',
    iosClientId: '501405946968-1fhtan9hkap4dctuo0tqnh21svta99ae.apps.googleusercontent.com',
    iosBundleId: 'com.example.moments.RunnerTests',
  );
}
