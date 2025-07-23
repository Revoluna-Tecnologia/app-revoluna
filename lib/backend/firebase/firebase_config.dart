import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA-jS50Jrv397C6geGYGzlF9e0H02FqH1Y",
            authDomain: "revoluna-81f7d.firebaseapp.com",
            projectId: "revoluna",
            storageBucket: "revoluna.firebasestorage.app",
            messagingSenderId: "860967636914",
            appId: "1:860967636914:web:aeec1c62067a0db1f09eab",
            measurementId: "G-F2Y8EF9BCC"));
  } else {
    await Firebase.initializeApp();
  }
}
