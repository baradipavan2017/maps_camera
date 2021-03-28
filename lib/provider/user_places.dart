import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:maps/models/place_model.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedtitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedtitle,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
