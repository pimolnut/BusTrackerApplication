import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testnewmap/current_location.dart';
import 'package:testnewmap/display_place.dart';
// import 'package:testnewmap/map_screen.dart';
// import 'package:testnewmap/pop_up_message.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:testnewmap/search.dart';
// import 'package:testnewmap/show_map.dart';
// import 'package:testnewmap/test.dart';
// import 'package:testnewmap/track_bus.dart';

/////////////////////////////// page 1 ////////////////////////////////
///  background + showpermission + nextpage to current location////////
////////next page show search location + show current location button + number bus///////

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: DisplayPage());
        // home: ShowMapOnPage(),
        // home: PopUpMessage());
        // home: SearchPage());
        // home: currentLocation());
        // home: LiveLovation());
        //home: BusStop());
        home: startScreen(
          title: "lk",
        ));
    //
  }
}

class startScreen extends StatefulWidget {
  const startScreen({super.key, required this.title});
  final String title;
  @override
  State<startScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<startScreen> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logo.png',
                width: 201,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome to our service!',
                style: TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              const SizedBox(
                height: 15,
              ),
              // Text(data)
              OutlinedButton.icon(
                onPressed: () {
                  checkPermission(Permission.location, context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => currentLocation()));

                  ///currentpage
                },
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start'),
              ),
            ],
          ),
          color: Color.fromARGB(255, 26, 16, 127),
          width: 500,
        ),
      ),
    );
  }
}

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
