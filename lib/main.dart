import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/welcomescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization for web and mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyC6SfPa7U_71-Wdkkft3xk9rew5sheR5v8",
        authDomain: "bolt-clone-824fa.firebaseapp.com",
        projectId: "bolt-clone-824fa",
        storageBucket: "bolt-clone-824fa.appspot.com",
        messagingSenderId: "776394058477",
        appId: "1:776394058477:web:11854c580e9aa2beff7ae4",
        measurementId: "G-MNLX6P766Y",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(DriveOnApp());
}

class DriveOnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
