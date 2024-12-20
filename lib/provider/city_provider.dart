import 'package:flutter/material.dart';
import 'package:weather_app/model/class/coordinate.dart';

class CityProvider extends ChangeNotifier {
  String _city = 'Select your city';
  Coordinate _coordinate = Coordinate(latitude: '', longitude: '');
  void selectCity({required String selected, required Coordinate coordinate}) {
    _city = selected;
    _coordinate = coordinate;
    notifyListeners();
  }

  String get getCity => _city;
  Coordinate get getCoodinate => _coordinate;
}
