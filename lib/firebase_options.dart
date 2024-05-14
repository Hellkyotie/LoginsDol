import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      /*case TargetPlatform.iOS:
        return ios;*/
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
    apiKey: 'AIzaSyDHwouRoui1JnXuk7yu6dZSVuvaLMjcv0A',
    appId: '1:11439477418:android:ff378adae6b1bb04bfb6d3',
    messagingSenderId: '1004145276065',
    projectId: 'flutterfire-samples-d79b4',
    authDomain: 'flutterfire-samples-d79b4.firebaseapp.com',
    storageBucket: 'login-page-34c07.appspot.com',
    //measurementId: 'G-91FSQTGJH8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClFCn-a3UJC-oukBQC4uy25_fEbuApTK0',
    appId: '1:11439477418:android:ff378adae6b1bb04bfb6d3',
    messagingSenderId: '11439477418',
    projectId: 'flutterfire-samples-d79b4',
    storageBucket: 'flutterfire-samples-d79b4.appspot.com',
  );

  /*static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClFCn-a3UJC-oukBQC4uy25_fEbuApTK0',
    appId: '1:1004145276065:android:655eeb98610cbb83162ce0',
    messagingSenderId: '132381301913',
    projectId: 'flutterfire-samples-d79b4',
    storageBucket: 'flutterfire-samples.appspot.com',
    androidClientId: '132381301913-5o1p8r5cr7hbmet7bjtltnk3hiv2eife.apps.googleusercontent.com',
    iosClientId: '132381301913-6ho0d2nv7b9q73ibmtsjq3es09leqbt9.apps.googleusercontent.com',
    iosBundleId: 'com.souvikbiswas.flutterfireExamples',
  );*/
}
