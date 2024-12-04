import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapsScreen extends StatefulWidget {
 @override
 _MapsScreenState createState() => _MapsScreenState();
}
class _MapsScreenState extends State<MapsScreen> {
 static final LatLng _kMapCenter =
 LatLng(19.018255973653343, 72.84793849278007);
 static final CameraPosition _kInitialPosition = CameraPosition(
 target: _kMapCenter,
 zoom: 11.0,
 );
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: Text('Google Maps'),
 ),
 body: GoogleMap(
 initialCameraPosition: _kInitialPosition,
 myLocationEnabled: true,
 ),
 );
 }
}
