import 'package:flutter/material.dart';
import 'package:geo_luggage_mystery/pages/main/main_screen.dart';
import 'package:geo_luggage_mystery/screens/welcome_screen.dart'; // Your home screen
import 'package:geo_luggage_mystery/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This function simulates checking if the user is logged in.
  // Replace with actual logic for retrieving login state.
  bool _isUserLoggedIn() {
    // Here, use your method to check login status
    // For example, SharedPreferences, a provider, or some other state management tool.
    return false; // Set to true if user is logged in, false otherwise
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
