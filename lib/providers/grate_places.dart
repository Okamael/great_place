import 'package:flutter/material.dart';
import 'package:great_place/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount => _items.length;

  Place getItem(int index) => _items[index];
}
