import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
  String _scanBarcode = 'Luggage';

  @override
  void initState() {
    super.initState();
  }

  // Function to scan QR code/RFID
// This function initiates the QR code scanning process.
  Future<void> scanQR() async {
    // Declare a variable to store the result of the scan.
    String barcodeScanRes;

    // Use a try-catch block to handle potential errors during scanning.
    try {
      // Call the scanBarcode method from the FlutterBarcodeScanner package to initiate the scan.
      // '#ff6666' specifies the color of the scan line.
      // 'Cancel' is the text displayed on the cancel button.
      // true enables the flash.
      // ScanMode.QR specifies that we are scanning for QR codes.
      //barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
         // '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      // If a PlatformException occurs, set the result to an error message.
      barcodeScanRes = 'Failed to get platform version.';
    }

    // Check if the widget is still mounted before updating the state.
    // This prevents errors if the widget has been disposed of.
    if (!mounted) return;

    // Update the state with the result of the scan.
    setState(() {
     // _scanBarcode = barcodeScanRes;
    });
  }

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
              _buildRFIDDetails(), // InkWell to trigger scanQR
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
    return const Text(
        'Sender Name: Onix Lumumba\nSender Address: 206-20116 Gilgil, Kenya\nSender Contact: +254706935045');
  }

  Widget _buildReceiverDetails() {
    return const Text(
        'Receiver Name: Sammie Barasa\nReceiver Address: 256 Kisumu, Kisumu, Kenya\nReceiver Contact: +254725153581');
  }

  // Widget with InkWell to trigger QR/RFID scan
  Widget _buildRFIDDetails() {
    return InkWell(
        onTap: () => scanQR(), // Call scanQR on tap
        child: Text('RFID Luggage_1: $_scanBarcode\n',
            style: const TextStyle(color: Colors.blue)));
  }

  Widget _buildMap() {
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