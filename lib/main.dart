import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users Live Location',
      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  const LocationApp({Key? key}) : super(key: key);

  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  var locationMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastposition = await Geolocator.getLastKnownPosition();
    var lat = position.latitude;
    var long = position.longitude;
    print("$lat, $long");
    setState(() {
      locationMessage = "Latitude : $lat, Longitude : $long";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Services"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              size: 46.0,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Get user location",
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
                "Position : $locationMessage",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getCurrentLocation();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 20))),
              child: const Text("Get Current Location"),
            ),
          ],
        ),
      ),
    );
  }
}
