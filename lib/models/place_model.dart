import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  PlaceLocation({
    @required this.longitude,
    @required this.latitude,
    this.address,
  });
}

class Place {
  final String id;
  final String titile;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.titile,
    @required this.location,
    @required this.image,
  });
}
