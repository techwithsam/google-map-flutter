import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_map/provider/location_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapPage extends StatefulWidget {
  GoogleMapPage({Key? key}) : super(key: key);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google Maps with Live Tracking'),
          centerTitle: true,
          elevation: 0,
        ),
        body: googleMapUI());
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(
      builder: (context, model, child) {
        if (model.locationPosition != null) {
          return Column(
            children: [
              Expanded(
                  child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: model.locationPosition!, zoom: 18),
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: Set<Marker>.of(model.marker!.values),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ))
            ],
          );
        }
        return Container(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
