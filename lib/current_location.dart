import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:testnewmap/display_place.dart';
import 'package:testnewmap/location.dart';
import 'package:testnewmap/map_screen.dart';
import 'package:testnewmap/search.dart';
import 'package:testnewmap/show_map.dart';
import 'package:testnewmap/track_bus.dart';
import 'package:testnewmap/track_bus2.dart';

//////////////////////  page 2 ///////////////////////////////////////////////////////
///show map + number bus + search destination location + button current location//////
/////////////////////////////////////////////////////////////////////////////////////
///search => page search destination
///button location => show location
///number bus => follow each number bus and show track bus

class currentLocation extends StatefulWidget {
  const currentLocation({super.key});

  @override
  State<currentLocation> createState() => _currentLocationState();
}

class _currentLocationState extends State<currentLocation> {
  var LocationMessage = '';
  final mapsWidgetController = GlobalKey<GoogleMapsWidgetState>();

  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

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
      body: Container(
        // width: double.maxFinite,
        // height: double.maxFinite,
        child: Stack(
          children: [
            MapScreen(),
            Positioned(
              top: 430,
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(191, 184, 184, 0.566),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    TextSearch(),
                    SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      padding: const EdgeInsets.all(3.0),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(134, 132, 131, 0.643),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pin_drop,
                              size: 30,
                              color: Color.fromARGB(255, 184, 43, 43),
                            ),
                            ButtonLocation(), ////
                          ],
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'หมายเลขรถ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "FCIconic",
                          ),
                        ),
                      ],
                    ),
                    // First
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(35, 51, 92, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          //tell 2 tracker
                          const Text(
                            ' 111 ',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "FCIconic",
                              fontSize: 23,
                            ),
                          ),
                          Image.asset(
                            'assets/img/GO_RBG_NEW.png',
                            height: 30,
                          ),
                          //tell dest
                          const Text(
                            ' V Condo',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "FCIconic",
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          //followButton
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BusStop2_111()));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(181, 219, 150, 1),
                              alignment: Alignment.centerRight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  'ติดตาม',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(35, 51, 92, 1),
                                    fontFamily: "FCIconic",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Second
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 10), // Adjust margin for spacing
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(35, 51, 92, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          //tell 2 tracker
                          const Text(
                            ' 777 ',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "FCIconic",
                              fontSize: 23,
                            ),
                          ),
                          Image.asset(
                            'assets/img/GO_RBG_NEW.png',
                            height: 30,
                          ),
                          //tell dest
                          const Text(
                            ' ARL ลาดกระบัง',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "FCIconic",
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          //followButton
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LatDisplay()));
                              //fn
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(181, 219, 150, 1),
                              alignment: Alignment.centerRight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  'ติดตาม',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(35, 51, 92, 1),
                                    fontFamily: "FCIconic",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonLocation extends StatelessWidget {
  const ButtonLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MapScreen()));
      },
      child: const Text(
        'Kmitl',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "FCIconic",
          color: Colors.white,
        ),
      ),
    );
  }
}

class TextSearch extends StatelessWidget {
  const TextSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(35, 51, 92, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Color.fromRGBO(255, 255, 255, 1),
            size: 32,
          ),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromRGBO(191, 191, 191, 0.786),
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              '  ระบุจุดหมายปลายทาง  ',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "FCIconic"),
            ),
          ),
        ],
      ),
    );
  }
}
