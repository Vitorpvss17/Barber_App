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
    apiKey: 'AIzaSyBviH0Tpkp49fMAt8szMUnI_jfCDjhCZpc',
    appId: '1:1034424220549:web:0911c6408031ee75b1a2ec',
    messagingSenderId: '1034424220549',
    projectId: 'murilobarberapp-mba',
    authDomain: 'murilobarberapp-mba.firebaseapp.com',
    storageBucket: 'murilobarberapp-mba.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfcVlDF6eCSc-Nco1PdniRhJl1M3-kp1k',
    appId: '1:1034424220549:android:c19890bf15613fd0b1a2ec',
    messagingSenderId: '1034424220549',
    projectId: 'murilobarberapp-mba',
    storageBucket: 'murilobarberapp-mba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJbUHSHlepMSBQCX_ARrzOMxRTRjdRTR8',
    appId: '1:1034424220549:ios:f83c2a7e8af84c6bb1a2ec',
    messagingSenderId: '1034424220549',
    projectId: 'murilobarberapp-mba',
    storageBucket: 'murilobarberapp-mba.appspot.com',
    iosClientId: '1034424220549-o127o01uur05s98dfif0lenfv435ruv0.apps.googleusercontent.com',
    iosBundleId: 'com.example.murilobarberapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJbUHSHlepMSBQCX_ARrzOMxRTRjdRTR8',
    appId: '1:1034424220549:ios:6f0e86a8ea6f0fe3b1a2ec',
    messagingSenderId: '1034424220549',
    projectId: 'murilobarberapp-mba',
    storageBucket: 'murilobarberapp-mba.appspot.com',
    iosClientId: '1034424220549-3co1ehccta7nfllterkjagefe363264a.apps.googleusercontent.com',
    iosBundleId: 'com.example.murilobarberapp.RunnerTests',
  );
}
