import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/class/weather.dart';

Future<Weather> fetchWeather({
  required String latitude,
  required String longitude,
}) async {
  const String url = "api.open-meteo.com";

  const path = '/v1/forecast';
  final querystring = {
    "latitude": latitude,
    "longitude": longitude,
    "hourly": ["temperature_2m", "weather_code"],
    "forecast_days": "1"
  };
  Uri urlParse = Uri.https(url, path, querystring);
  final response = await http.get(urlParse);
  if (response.statusCode == 200) {
    return Weather.fromJson(
        jsonDecode(response.body)['hourly'] as Map<String, dynamic>);
  } else {
    throw Exception(
      'API call returned: ${response.statusCode} ${response.reasonPhrase}',
    );
  }
}
