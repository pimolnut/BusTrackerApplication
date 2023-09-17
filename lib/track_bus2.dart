import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testnewmap/location.dart';

///////////////////////////page 3/////////////////////////////////////////
/////show bus stop and each location + travel time (bus number is 111)//////////

List<Map<String, dynamic>> bus = [
  {'id': 0, 'name': 'อู่รถเมลล์ลาดกระบัง'},
  {'id': 1, 'name': 'ตลาดหัวตะเข้ '},
  {'id': 2, 'name': 'ซอยจินดา'},
  {'id': 3, 'name': 'สวนพระนคร'},
  {'id': 4, 'name': 'คณะเทคโนโลยีการเกษตร'},
  {'id': 5, 'name': 'ประตูทางโค้งคณะสถาปัตยกรรมศาสตร์'},
  {'id': 6, 'name': 'ป้ายใหญ่คณะวิศวกรรมศาสตร์'},
  {'id': 7, 'name': 'คณะวิทย์'},
  {'id': 8, 'name': 'คณะบริหาร '},
  {'id': 9, 'name': 'คณะเทคโนโลยี สารสนเทศ'},
  {'id': 10, 'name': 'หมู่บ้านรุ่งอรุณ1'},
  {'id': 11, 'name': 'หมู่บ้านรุ่งอรุณ2'},
  {'id': 12, 'name': 'สง่าหมูกระทะ'},
  {'id': 13, 'name': 'ไอเพลส'},
  {'id': 14, 'name': 'นิคมลาดกระบัง V condo'},
];

class BusStop2_111 extends StatefulWidget {
  const BusStop2_111({super.key});

  @override
  State<BusStop2_111> createState() => _BusStop2_111State();
}

class _BusStop2_111State extends State<BusStop2_111> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromRGBO(10, 26, 127, 0.751),
      ),
      body: Stack(children: [
        ShowMapAndMark2(),
        DraggableScrollableSheet(
          initialChildSize: 0.35,
          minChildSize: 0.3,
          maxChildSize: 1,
          snapSizes: [0.5, 1],
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color:
                  Color.fromRGBO(12, 25, 103, 0.671), // 0.6 = transparent color
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
                            child: Column(
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
                                  //////////////13.728934101879902, 100.77790951077614
                                  //tell 2 tracker
                                  Text(
                                    '111 ',
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
                                    ' V Condo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "FCIconic",
                                      fontSize: 20,
                                    ),
                                  ),
                                  //tell time
                                  Text(
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
                                              ShowMapAndMark2()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  onPrimary: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
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
                    color: Color.fromRGBO(10, 26, 127, 0.486),
                    child: ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.all(5),
                      leading: Image.asset(
                        'assets/img/locationTransparen_RBG_NEW.png',
                        height: 120,
                      ),
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                busData['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "FCIconic",
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 5,
                            ),
                            child: Divider(
                              height: 7,
                              thickness: 2,
                              color: const Color.fromARGB(255, 119, 120, 121),
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

class ShowMapAndMark2 extends StatefulWidget {
  const ShowMapAndMark2({super.key});
  @override
  State<ShowMapAndMark2> createState() => _ShowMapAndMark2State();
}

class _ShowMapAndMark2State extends State<ShowMapAndMark2> {
  static const LatLng source = LatLng(13.72987831788902, 100.77799696840856);
  static const LatLng dest = LatLng(13.758208383681616, 100.79406011634818);

  static String API = 'AIzaSyDkrfYFY_JAb_mkmkWLltLnk6TNH9nlolc';
  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      API,
      PointLatLng(13.72987831788902, 100.77799696840856),
      PointLatLng(13.758208383681616, 100.79406011634818),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();
    setCustomMarkerIcon();
    super.initState();
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
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: const Color(0xFF7B61FF),
            width: 6,
          ),
        },
        minMaxZoomPreference: MinMaxZoomPreference(10, 15),
        markers: {
          Marker(
            markerId: MarkerId("source"),
            infoWindow: InfoWindow(title: 'KMITL'),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(source.latitude, source.longitude),
            draggable: true,
          ),
          Marker(
            markerId: MarkerId("des"),
            infoWindow: InfoWindow(title: 'V condo'),
            icon: currentLocationIcon,
            position: LatLng(dest.latitude, dest.longitude),
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
