import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static final CameraPosition _kgooglePlex = CameraPosition(
    target: LatLng(13.72987831788902, 100.77799696840856),
    zoom: 10,
  );

  static final Marker _GoogleMark = Marker(
      markerId: MarkerId('_kgooglePlex'),
      infoWindow: InfoWindow(title: 'KMITL'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(13.72987831788902, 100.77799696840856));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.749),
      ),
      body: Container(
        child: GoogleMap(
          initialCameraPosition: _kgooglePlex,
          minMaxZoomPreference: MinMaxZoomPreference(15, 15),
          markers: {_GoogleMark},
        ),
      ),
    );
  }
}
