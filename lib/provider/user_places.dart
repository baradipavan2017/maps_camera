import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:maps/models/place_model.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedtitle, File pickedImage) {
    print("inserting data");
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedtitle,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
    //inserting data as map
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    print("details fetching");
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
