import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geo_luggage_mystery/pages/main/main_screen.dart';
import 'package:geo_luggage_mystery/screens/welcome_screen.dart';
import 'package:geo_luggage_mystery/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString = prefs.getString('themeMode');
    if (themeModeString != null) {
      setState(() {
        _themeMode = themeModeString == 'dark' ? ThemeMode.dark : ThemeMode.light;
      });
    }
  }

  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'themeMode', themeMode == ThemeMode.dark ? 'dark' : 'light');
  }

  void _changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
    _saveThemeMode(themeMode);
  }

  bool _isUserLoggedIn() {
    // Replace this with your actual login check logic
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geo Luggage',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: _themeMode,
      home: ThemeSwitcher(
        changeTheme: _changeTheme,
        child: _isUserLoggedIn() ? const MainScreen() : const WelcomeScreen(),
      ),
    );
  }
}

class ThemeSwitcher extends InheritedWidget {
  final void Function(ThemeMode) changeTheme;

  const ThemeSwitcher({
    super.key,
    required this.changeTheme,
    required super.child,
  });

  static ThemeSwitcher? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>();
  }

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) {
    return changeTheme != oldWidget.changeTheme;
  }
}