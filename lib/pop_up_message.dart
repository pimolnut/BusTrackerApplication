import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

//////////////empty page///////////////
///
///
Future<void> checkPermission(
    Permission permission, BuildContext context) async {
  final status = await permission.request();
  if (status.isGranted) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Permission is Granted")));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Permission is  not Granted")));
  }
}
