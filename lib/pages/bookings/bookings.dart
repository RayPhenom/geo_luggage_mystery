import 'package:flutter/material.dart';
import 'package:geo_luggage_mystery/pages/bookings/tabs/canceled.dart';
import 'package:geo_luggage_mystery/pages/bookings/tabs/past.dart';
import 'package:geo_luggage_mystery/pages/bookings/tabs/upcoming.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: "Upcoming",),
              Tab(icon: Icon(Icons.directions_transit), text: "Past",),
              Tab(icon: Icon(Icons.disabled_by_default_rounded), text: "Canceled",),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UpcomingBookings(),
            PastBookings(),
           CanceledBookings(),
          ],
        ) ,
      ),
    );
  }
}