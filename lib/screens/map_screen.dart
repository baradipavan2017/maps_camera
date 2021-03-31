import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place_model.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;
  //putting in [] for optional inputs
  //converting place_model to const valuse
  MapScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: 37.422, longitude: -122.084),
      this.isSelecting = false});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //saving the lat and long
  LatLng _pickedLocation;
  //selecting the location with marker
  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your map'),
        actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        //markers are sets use {} instead of null for false
        markers: _pickedLocation == null
            ? {}
            : {
                Marker(
                  markerId: MarkerId('m1'),
                  position: _pickedLocation,
                ),
              },
      ),
    );
  }
}
