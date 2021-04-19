import 'package:flutter/material.dart';
import 'package:flutter_google_map/map.dart';

// AIzaSyBd7b-lB7DVlvdlTH4eqeRtW2odIcR94QY
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechWithSam - Flutter Google Maps & Live Tracking',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: GoogleMapPage(),
    );
  }
}
