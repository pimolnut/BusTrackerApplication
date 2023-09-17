import 'dart:math';

/////////////////////empty page//////////////////////////
///
import 'package:flutter/material.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class LiveLovation extends StatelessWidget {
  final mapsWidgetController = GlobalKey<GoogleMapsWidgetState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: GoogleMapsWidget(
                  apiKey: "AIzaSyDkrfYFY_JAb_mkmkWLltLnk6TNH9nlolc",
                  key: mapsWidgetController,
                  sourceLatLng: LatLng(
                    40.484000837597925,
                    -3.369978368282318,
                  ),
                  destinationLatLng: LatLng(
                    40.48017307700204,
                    -3.3618026599287987,
                  ),

                  ///////////////////////////////////////////////////////
                  //////////////    OPTIONAL PARAMETERS    //////////////
                  ///////////////////////////////////////////////////////

                  routeWidth: 2,
                  sourceMarkerIconInfo: MarkerIconInfo(
                    infoWindowTitle: "This is source name",
                    onTapInfoWindow: (_) {
                      print("Tapped on source info window");
                    },
                    assetPath: "assets/img/locationTransparen_RBG_NEW.png",
                  ),
                  destinationMarkerIconInfo: MarkerIconInfo(
                    assetPath: "assets/img/locationTransparen_RBG_NEW.png",
                  ),
                  driverMarkerIconInfo: MarkerIconInfo(
                    infoWindowTitle: "Alex",
                    assetPath: "assets/img/locationTransparen_RBG_NEW.png",
                    onTapMarker: (currentLocation) {
                      print("Driver is currently at $currentLocation");
                    },
                    assetMarkerSize: Size.square(125),
                    rotation: 90,
                  ),
                  onPolylineUpdate: (p) {
                    print("Polyline updated: ${p.points}");
                  },
                  updatePolylinesOnDriverLocUpdate: true,
                  // mock stream
                  driverCoordinatesStream: Stream.periodic(
                    Duration(milliseconds: 500),
                    (i) => LatLng(
                      40.47747872288886 + i / 10000,
                      -3.368043154478073 - i / 10000,
                    ),
                  ),
                  totalTimeCallback: (time) => print(time),
                  totalDistanceCallback: (distance) => print(distance),
                ),
              ),
              // demonstrates how to interact with the controller
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          mapsWidgetController.currentState!.setSourceLatLng(
                            LatLng(
                              40.484000837597925 * (Random().nextDouble()),
                              -3.369978368282318,
                            ),
                          );
                        },
                        child: Text('Update source'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final googleMapsCon = await mapsWidgetController
                              .currentState!
                              .getGoogleMapsController();
                          googleMapsCon.showMarkerInfoWindow(
                            MarkerIconInfo.sourceMarkerId,
                          );
                        },
                        child: Text('Show source info'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
