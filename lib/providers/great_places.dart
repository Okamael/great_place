import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_place/models/place.dart';
import 'package:great_place/utils/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: PlaceLocation(latitude: 0, longitude: 0),
            image: File(item['image'])))
        .toList();
    notifyListeners();
  }

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount => _items.length;

  Place itemByIndex(int index) => _items[index];

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: Random().nextDouble().toString(),
        title: title,
        location: PlaceLocation(latitude: 0, longitude: 0),
        image: image);
    _items.add(newPlace);
    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
    notifyListeners();
  }
}