import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/UI/views/city_list_view.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/UI/views/home_view.dart';
import 'package:weather_app/provider/city.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => City(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
        routes: {
          home: (context) => const HomeView(),
          selectView: (context) => const CityListView()
        },
      ),
    ),
  );
}
