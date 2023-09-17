import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

///////////////////////link to current location///////////////////////
/////////show map and mark location///////////////////////////////////

class ShowMapOnPage extends StatefulWidget {
  const ShowMapOnPage({super.key});

  @override
  State<ShowMapOnPage> createState() => _ShowMapOnPageState();
}

class _ShowMapOnPageState extends State<ShowMapOnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(13.78080437590858, 100.66849495671624),
            zoom: 10,
          ),
          minMaxZoomPreference: MinMaxZoomPreference(10, 15),
          markers: {
            Marker(
              markerId: MarkerId("start"),
              position: LatLng(13.760386107596172, 100.62292908591695),
              draggable: true,
            ),
            // Marker(
            //   markerId: MarkerId("des"),
            //   position: LatLng(13.779055483121487, 100.66550314293781),
            //   draggable: true,
            // ),
          },
        ),
      ),
    );
  }
}
