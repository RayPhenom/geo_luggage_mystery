import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geo_luggage_mystery/pages/main/main_screen.dart';
import 'package:geo_luggage_mystery/screens/welcome_screen.dart'; 
import 'package:geo_luggage_mystery/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
   await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBzSOBC8gT4kj_nmwnkbxtnQc0ik-Eov-0",
            authDomain: "geo-lugsetup.firebaseapp.com",
            projectId: "geo-lugsetup",
            storageBucket: "geo-lugsetup.firebasestorage.app",
            messagingSenderId: "217806099786",
            appId: "1:217806099786:web:db2276ea6a880c6cc29db3"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool _isUserLoggedIn() {
    
    return false; 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geo Luggage',
      theme: lightMode,
      home: _isUserLoggedIn() ? const MainScreen() : const WelcomeScreen(),
    );
  }
}
