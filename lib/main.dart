import 'package:flutter/material.dart';
import 'package:geo_luggage_mystery/screens/welcome_screen.dart';
import 'package:geo_luggage_mystery/theme/theme.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geo luggage ',
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}


