import 'package:flutter/material.dart';
import 'package:geo_luggage_mystery/pages/bookings/bookings.dart';
import 'package:geo_luggage_mystery/pages/home/home_screen.dart';
import 'package:geo_luggage_mystery/pages/menu/menu.dart';
import 'package:geo_luggage_mystery/pages/parcels/parcels.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const BookingsScreen(),
      const MenuScreen(),
      const ParcelsScreen()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          debugPrint("***********************$index");
          setState(() {
            _currIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, color: Colors.red,), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus, color: Colors.red), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.apps, color: Colors.red), label: "Menu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard, color: Colors.red), label: "Parcels"),
        ],
        currentIndex: _currIndex,
      ),
      body: screens[_currIndex],
    );
  }
}