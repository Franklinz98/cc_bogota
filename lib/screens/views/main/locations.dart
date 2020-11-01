import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CCLocations extends StatefulWidget {
  @override
  _CCLocationsState createState() => _CCLocationsState();
}

class _CCLocationsState extends State<CCLocations> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set();
  GoogleMapController mapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(4.654628, -74.152657),
    zoom: 16,
  );

  String _darkMapStyle;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/json/maps_style.json').then((string) {
      _darkMapStyle = string;
    });
    _markers.add(
      Marker(
        markerId: MarkerId('ccbogota'),
        position: LatLng(4.654628, -74.152657),
        infoWindow: InfoWindow(title: "Centro Cristiano Bogotá"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: GoogleMap(
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              if (!_controller.isCompleted) {
                _controller.complete(controller);
              }
              mapController = controller;
              mapController.setMapStyle(_darkMapStyle);
              // controller.setMapStyle(_darkMapStyle);
            },
            markers: _markers,
            zoomControlsEnabled: false,
          ),
        ),
      ],
    );
  }
}
