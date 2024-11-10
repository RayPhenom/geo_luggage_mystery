import 'package:flutter/material.dart';

class UpcomingBookings extends StatelessWidget {
  const UpcomingBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Center( // Wrapping Image.asset with Center widget
                  child: Image.asset("assets/images/book.png", fit: BoxFit.contain),
                ),
                Container(
                  padding: const EdgeInsets.all(40),
                  margin: const EdgeInsets.all(40),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed action here
                    },
                    child: const Text('Book Now'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}