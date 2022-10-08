import 'dart:io';
import 'package:flutter/foundation.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: PlaceLocation(latitude: 1, longitude: 1),
      image: image,
    );

    _items.insert(0, newPlace);
    notifyListeners();
  }
}
