import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_map/provider/location_provider.dart';
import 'package:flutter_google_map/widgets/search_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SearchWidget().search,
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.directions),
      ),
      body: Consumer<LocationProvider>(
        builder: (context, model, child) {
          if (model.locationPosition != null) {
            return Column(
              children: [
                Expanded(
                    child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: model.locationPosition!, zoom: 18),
                  mapType: MapType.normal,
                  compassEnabled: true,
                  trafficEnabled: true,
                  zoomControlsEnabled: false,
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
      ),
    );
  }
}
