import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testnewmap/current_location.dart';

import 'package:testnewmap/display_place.dart';

///////////////////////////page 3/////////////////////////////////////////
/////show bus stop and each location + travel time (bus number is 777)//////////
double myLongDouble = double.parse(myLongStr);
double myLatDouble = double.parse(myLatStr);
List<Map<String, dynamic>> bus = [
  {'id': 0, 'name': 'แยกสนามบิน'},
  {'id': 1, 'name': 'แยกร่มเกล้า - ลาดกระบัง'},
  {'id': 2, 'name': 'สำนักงานเขตลาดกระบัง'},
  {'id': 3, 'name': 'สน.ลาดกระบัง'},
  {'id': 4, 'name': 'วัดปลูกศรัทธา(วัด 4)'},
  {'id': 5, 'name': 'แยกเจ้าคุณทหาร'},
  {'id': 6, 'name': 'ตรงข้าม FBT'},
  {'id': 7, 'name': 'คณะเทคโนโลยีการเกษตร'},
  {'id': 8, 'name': 'ประตูทางโค้งคณะสถาปัตยกรรมศาสตร์'},
  {'id': 9, 'name': 'ป้ายใหญ่คณะวิศวกรรมศาสตร์'},
  {'id': 10, 'name': 'ตรงข้ามคณะวิทย์'},
  {'id': 11, 'name': 'ตึกอธิการบดี'},
  {'id': 12, 'name': 'คณะ IT'},
  {'id': 13, 'name': 'ทางออกมอเตอร์เวย์'},
  {'id': 14, 'name': 'แอร์พอร์ตลิ้งค์ลาดกระบัง', 'price': 5.0},
];

class BusStop extends StatefulWidget {
  const BusStop({super.key});

  @override
  State<BusStop> createState() => _BusStopState();
}

class _BusStopState extends State<BusStop> {
  Timer? timer;
  late double num1;
  late double num2;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        myLongDouble = double.parse(myLongStr);
        myLatDouble = double.parse(myLatStr);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => currentLocation()));
          },
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.749),
      ),
      body: Stack(children: [
        Positioned(
          top: 16.0,
          left: 16.0,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle navigation here to go back to the previous page.
              Navigator.of(context).pop();
            },
          ),
        ),
        ShowMapAndMark(),
        DraggableScrollableSheet(
          initialChildSize: 0.35,
          minChildSize: 0.3,
          maxChildSize: 1,
          snapSizes: [0.5, 1],
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color:
                  Color.fromRGBO(14, 13, 13, 0.565), // 0.6 = transparent color
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                controller: scrollController,
                itemCount: bus.length,
                itemBuilder: (BuildContext context, int index) {
                  final busData = bus[index];
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          Container(
                            child: const Column(
                              children: [
                                //show pull up bar
                                SizedBox(
                                  width: 50,
                                  child: Divider(
                                    thickness: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  //tell 2 tracker
                                  const Text(
                                    '777 ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "FCIconic",
                                      fontSize: 20,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/img/GO_RBG_NEW.png',
                                    height: 30,
                                  ),
                                  //tell dest
                                  Text(
                                    ' ARL ลาดกระบัง',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "FCIconic",
                                      fontSize: 20,
                                    ),
                                  ),
                                  //tell time
                                  const Text(
                                    ' 9 นาที',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "FCIconic",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShowMapAndMark()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  onPrimary: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'ยืนยัน',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "FCIconic",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  //DATA of bus stop
                  return Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    color: Color.fromRGBO(35, 51, 92, 1),
                    child: ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.all(5),
                      leading: Image.asset(
                        'assets/img/BusStop_RBG.png',
                        height: 120,
                      ),
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                busData['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "FCIconic",
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 5,
                            ),
                            child: Divider(
                              height: 7,
                              thickness: 2,
                              color: Color.fromARGB(255, 119, 120, 121),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ]),
    );
  }
}

class ShowMapAndMark extends StatefulWidget {
  const ShowMapAndMark({super.key});

  @override
  State<ShowMapAndMark> createState() => _ShowMapAndMarkState();
}

class _ShowMapAndMarkState extends State<ShowMapAndMark> {
  final Completer<GoogleMapController> _controller = Completer();
  static String API = 'AIzaSyDkrfYFY_JAb_mkmkWLltLnk6TNH9nlolc';
  static LatLng source = LatLng(13.72987831788902, 100.77799696840856);
  static LatLng dest = LatLng(myLatDouble, myLongDouble);
  List<LatLng> _polylineCoordinates = [];
  Set<Polyline> _polylines = {};
  PolylinePoints _polylinePoints = PolylinePoints();

  @override
  void initState() {
    super.initState();
    setCustomMarkerIcon();
    _getPolyline();
  }

  Future<void> _getPolyline() async {
    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
      API,
      PointLatLng(
          13.72987831788902, 100.77799696840856), // Starting coordinates
      PointLatLng(myLatDouble, myLongDouble), // Ending coordinates
    );

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        _polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
        _polylines.add(Polyline(
          polylineId: PolylineId('polyline_id'),
          points: _polylineCoordinates,
          color: Color.fromARGB(255, 181, 21, 255),
          width: 5,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(13.72976753118423, 100.75748581588128),
          zoom: 10.0,
        ),

        //markers: {_GoogleMark},
        polylines: _polylines,
        minMaxZoomPreference: MinMaxZoomPreference(10, 15),
        markers: {
          Marker(
            markerId: MarkerId("source"),
            infoWindow: InfoWindow(title: 'KMITL'),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(13.72987831788902, 100.77799696840856),
            draggable: true,
          ),
          Marker(
            markerId: MarkerId("des"),
            infoWindow: InfoWindow(title: 'current location'),
            icon: currentLocationIcon,
            position: LatLng(myLatDouble, myLongDouble),
            draggable: true,
          ),
        },
      ),
    );
  }
}

BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
void setCustomMarkerIcon() {
  BitmapDescriptor.fromAssetImage(
          ImageConfiguration.empty, "assets/img/BusStop_RBG.png")
      .then(
    (icon) {
      currentLocationIcon = icon;
    },
  );
}
