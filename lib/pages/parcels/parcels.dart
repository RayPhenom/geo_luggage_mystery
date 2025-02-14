import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import "package:flutter_barcode_scanner/flutter_barcode_scanner.dart";

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
  String _scanBarcode = 'Luggage'; // Initialize as String

  // Sender Details Controllers
  final TextEditingController _senderNameController = TextEditingController();
  final TextEditingController _senderAddressController = TextEditingController();
  final TextEditingController _senderContactController = TextEditingController();

  // Receiver Details Controllers
  final TextEditingController _receiverNameController = TextEditingController();
  final TextEditingController _receiverAddressController =
  TextEditingController();
  final TextEditingController _receiverContactController =
  TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      // Call the scanBarcode method from the FlutterBarcodeScanner package to initiate the scan.
      // '#ff6666' specifies the color of the scan line.
      // 'Cancel' is the text displayed on the cancel button.
      // true enables the flash.
      // ScanMode.QR specifies that we are scanning for QR codes.
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
      debugPrint('Scan result: $barcodeScanRes');
    } on PlatformException {
      // If a PlatformException occurs, set the result to an error message.
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    // Update the state with the result of the scan.
    setState(() {
      _scanBarcode = barcodeScanRes;
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
    _senderNameController.dispose();
    _senderAddressController.dispose();
    _senderContactController.dispose();
    _receiverNameController.dispose();
    _receiverAddressController.dispose();
    _receiverContactController.dispose();
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

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSenderDetails() {
    return Column(
      children: [
        _buildTextField(label: ' Name', controller: _senderNameController),
        _buildTextField(label: ' Address', controller: _senderAddressController),
        _buildTextField(
            label: ' Contact',
            controller: _senderContactController,
            keyboardType: TextInputType.phone),
      ],
    );
  }

  Widget _buildReceiverDetails() {
    return Column(
      children: [
        _buildTextField(label: ' Name', controller: _receiverNameController),
        _buildTextField(
            label: 'Address', controller: _receiverAddressController),
        _buildTextField(
            label: 'Contact',
            controller: _receiverContactController,
            keyboardType: TextInputType.phone),
      ],
    );
  }

  // Widget with InkWell to trigger QR/RFID scan
  Widget _buildRFIDDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => scanQR(), // Call scanQR on tap
          child: const Text(
            'Scan RFID',
            style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
          ),
        ),
        const SizedBox(height: 8),
        Text('RFID Result: $_scanBarcode'),
      ],
    );
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