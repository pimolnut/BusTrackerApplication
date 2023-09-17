import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:testnewmap/location.dart';
import 'package:testnewmap/track_bus.dart';
import 'package:testnewmap/track_bus2.dart';

String myLongStr = "";
String myLatStr = "";

List<String> latArr = ["0", "1", "2", "3"];
List<String> longArr = ["0", "1", "2", "3"];
int myCount = 0;

class LatDisplay extends StatefulWidget {
  LatDisplay({super.key});

  @override
  State<LatDisplay> createState() => _LatDisplayState();
}

class _LatDisplayState extends State<LatDisplay> {
  Query refQ =
      FirebaseDatabase.instance.ref().child('users'); //ตำแหน่งที่เก็บข้อมูล
  void initState() {
    super.initState();

    // Start a timer to navigate to Page2 after 3 seconds (adjust as needed).
    Timer(Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BusStop()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FirebaseAnimatedList(
            query: refQ,
            itemBuilder: (context, snapshot, animation, index) {
              Map userMap = snapshot.value as Map;
              userMap['key'] = snapshot.key;
              if (userMap['lat'] != null) {
                myLatStr = userMap['lat'];
                myLongStr = userMap['long'];
                latArr.add(userMap['lat']);
                longArr.add(userMap['long']);
              }
              print("=============");
              myLatStr = latArr[latArr.length - 2];
              myLongStr = longArr[longArr.length - 2];
              print(myLatStr);
              print(latArr);
              myCount = myCount + 1;
              print(myCount++);
              print("**aaa***");
              latArr.removeAt(0);
              longArr.remove(0);
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Loading')],
                ),
              );
            }));
  }
}
