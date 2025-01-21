import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParcelsScreen extends StatefulWidget {
  const ParcelsScreen({super.key});

  @override
  State<ParcelsScreen> createState() => _ParcelsScreenState();
}

class _ParcelsScreenState extends State<ParcelsScreen> {
  late GoogleMapController myController;
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  final LatLng _center = const LatLng(-1.0986984, 36.9666969);
  bool _isMapLoaded = false;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    myController = controller;
    setState(() {
      _isMapLoaded = true;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parcel Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sender Details:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              _buildSenderDetails(),
              const SizedBox(height: 20.0),
              const Text(
                'Receiver Details:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              _buildReceiverDetails(),
              const SizedBox(height: 20.0),
              const Text(
                'RFID Tags Details:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              _buildRFIDDetails(),
              const SizedBox(height: 20.0),
              const Text(
                'Map:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50.0),
              _buildMap(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSenderDetails() {
    // Implement sender details widget
    return const Text(
        'Sender Name: Onix Lumumba\nSender Address: 206-20116 Gilgil, Kenya\nSender Contact: +254706935045');
  }

  Widget _buildReceiverDetails() {
    // Implement receiver details widget
    return const Text(
        'Receiver Name: Sammie Barasa\nReceiver Address: 256 Kisumu, Kisumu, Kenya\nReceiver Contact: +254725153581');
  }

  Widget _buildRFIDDetails() {
    // Implement RFID details widget
    return const Text("RFID Tag 1: Hw-126");
  }

  Widget _buildMap() {
    // Implement map widget
    return SizedBox(
      height: 800.0,
      child: _isMapLoaded
          ? GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 10.0,
        ),
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}