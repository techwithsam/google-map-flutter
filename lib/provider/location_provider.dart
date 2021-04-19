import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  BitmapDescriptor? _pinLocationIcon;
  BitmapDescriptor? get pinLocationIcon => _pinLocationIcon;
  Map<MarkerId, Marker>? _marker;
  Map<MarkerId, Marker>? get marker => _marker;

  final MarkerId markerId = MarkerId("1");

  Location? _location;
  Location? get location => _location;
  LatLng? _locationPosition;
  LatLng? get locationPosition => _locationPosition;

  bool locationServiceActive = true;

  LocationProvider() {
    _location = Location();
  }

  initialization() async {
    await getUserLocation();
    await setCustomMapPin();
  }

  getUserLocation() async {
    bool _serviceEnable;
    PermissionStatus _permissionGranted;

    _serviceEnable = await location!.serviceEnabled();
    if (!_serviceEnable) {
      _serviceEnable = await location!.requestService();

      if (!_serviceEnable) {
        return;
      }
    }

    _permissionGranted = await location!.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location!.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location!.onLocationChanged.listen((LocationData currentLocation) {
      _locationPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);

      print(_locationPosition);

      _marker = <MarkerId, Marker>{};
      Marker marker = Marker(
        markerId: markerId,
        position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        icon: (pinLocationIcon)!,
        draggable: true,
        onDragEnd: ((newPosition) {
          _locationPosition =
              LatLng(newPosition.latitude, newPosition.longitude);
          notifyListeners();
        }),
      );

      _marker![markerId] = marker;
      notifyListeners();
    });
  }

  setCustomMapPin() async {
    _pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/pin1.png',
    );
  }
}
