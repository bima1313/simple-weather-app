import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/model/class/coordinate.dart';
import 'package:weather_app/provider/city_provider.dart';

final Map<String, Coordinate> cityCoordinate = {
  'jakarta pusat': Coordinate.sendCoordinate("-6.1818", "106.8223"),
  'london': Coordinate.sendCoordinate("51.5085", "-0.1257"),
  'new york': Coordinate.sendCoordinate("40.7143", "-74.006"),
};

class CityListView extends StatelessWidget {
  const CityListView({super.key});

  @override
  Widget build(BuildContext context) {
    final CityProvider selected = context.watch<CityProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select your city',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: cityCoordinate.length,
        itemBuilder: (context, index) {
          final String city = cityCoordinate.keys.elementAt(index);
          final Coordinate coordinate = cityCoordinate.values.elementAt(index);

          return ListTile(
            title: Text(
              city,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              selected.selectCity(selected: city, coordinate: coordinate);
              Navigator.pushNamedAndRemoveUntil(
                context,
                home,
                (route) => false,
              );
            },
          );
        },
      ),
    );
  }
}
