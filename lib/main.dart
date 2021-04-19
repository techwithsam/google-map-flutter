import 'package:flutter/material.dart';
import 'package:flutter_google_map/map.dart';
import 'package:flutter_google_map/provider/location_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: GoogleMapPage(),
        )
      ],
      child: MaterialApp(
        title: 'TechWithSam - Flutter Google Maps & Live Tracking',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: GoogleMapPage(),
      ),
    );
  }
}
