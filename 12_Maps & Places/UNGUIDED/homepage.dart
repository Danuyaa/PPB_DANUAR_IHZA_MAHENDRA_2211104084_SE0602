import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/widgets/place_picker.dart';

class MyMaps extends StatefulWidget {
  @override
  _MyMapsState createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  static final LatLng _kMapCenter = LatLng(-7.4350516, 109.2496451);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {},
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
onPressed: () async {
  try {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: 'AIzaSyAcSljDchgC3U736cT_CBHdEqFCqD3G4no',
          initialLocation: _kMapCenter,
        ),
      ),
    );
    if (result != null) {
      print('Selected Place: ${result.formattedAddress}');
    }
  } catch (e) {
    print('Error: $e');
  }
},
              child: Text("Pick a Place"),
            ),
          ),
        ],
      ),
    );
  }
}