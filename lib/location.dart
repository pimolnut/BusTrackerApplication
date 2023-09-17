import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:testnewmap/location.dart';
import 'dart:convert' as convert;

// double calculateDistance(lat1, lon1, lat2, lon2) {
//   var p = 0.017453292519943295;
//   var c = cos;
//   var a = 0.5 -
//       c((lat2 - lat1) * p) / 2 +
//       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//   return 12742 * asin(sqrt(a));
// }

///////////////////use to Link page track bus//////////////////////////////////////
///show distance between 2 location /////////////////////

class ShowLocation extends StatefulWidget {
  const ShowLocation({super.key});

  @override
  State<ShowLocation> createState() => _ShowLocationState();
}

class _ShowLocationState extends State<ShowLocation> {
  static const LatLng source = LatLng(13.779055483121487, 100.66550314293781);
  static const LatLng dest = LatLng(13.72796931299048, 100.74734597789177);

  final Polyline _kPolyline = Polyline(
    polylineId: PolylineId('_kPolyline'),
    color: const Color(0xFF7B61FF),
    width: 6,
    points: [
      LatLng(source.latitude, source.longitude),
      LatLng(dest.latitude, dest.longitude)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(13.72796931299048, 100.74734597789177),
            zoom: 10,
          ),
          polylines: {
            _kPolyline,
          },
          minMaxZoomPreference: MinMaxZoomPreference(10, 15),
          markers: {
            Marker(
              markerId: MarkerId("start"),
              position: LatLng(source.latitude, source.longitude),
              draggable: true,
            ),
            Marker(
              markerId: MarkerId("des"),
              position: LatLng(dest.latitude, dest.longitude),
              draggable: true,
            ),
          },
        ),
      ),
    );
  }
}
