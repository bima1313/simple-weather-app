import 'package:weather_app/class/weather_image.dart';

String weatherCode({required int weatherCode, required bool isImage}) {
  if (isImage == true) {
    final code = {
      0: WeatherImage.sunny,
      1: WeatherImage.mainlyClear,
      2: WeatherImage.partlyCloudy,
      3: WeatherImage.overcast,
      45: WeatherImage.fog,
      48: WeatherImage.fog,
      51: WeatherImage.drizzle,
      53: WeatherImage.drizzle,
      55: WeatherImage.drizzle,
      56: WeatherImage.freezeDrizzle,
      57: WeatherImage.freezeDrizzle,
      61: WeatherImage.rain,
      63: WeatherImage.rain,
      65: WeatherImage.rain,
      66: WeatherImage.freezeRain,
      67: WeatherImage.freezeRain,
      71: WeatherImage.snow,
      73: WeatherImage.snow,
      75: WeatherImage.snow,
      77: WeatherImage.snow,
      80: WeatherImage.rain,
      81: WeatherImage.rain,
      82: WeatherImage.rain,
      85: WeatherImage.snow,
      86: WeatherImage.snow,
      95: WeatherImage.thunderstrom,
      96: WeatherImage.thunderstrom,
      99: WeatherImage.thunderstrom,
    };

    final String weather = code[weatherCode]!;
    return weather;
  } else {
    final code = {
      0: 'sunny',
      1: 'mainly clear',
      2: 'partly cloudy',
      3: 'overcast',
      45: 'fog',
      48: 'fog',
      51: 'drizzle',
      53: 'drizzle',
      55: 'drizzle',
      56: 'freeze drizzle',
      57: 'freeze drizzle',
      61: 'rain',
      63: 'rain',
      65: 'rain',
      66: 'freeze rain',
      67: 'freeze rain',
      71: 'snow',
      73: 'snow',
      75: 'snow',
      77: 'snow',
      80: 'rain',
      81: 'rain',
      82: 'rain',
      85: 'snow',
      86: 'snow',
      95: 'thunderstrom',
      96: 'thunderstrom',
      99: 'thunderstrom',
    };

    final String weather = code[weatherCode]!;
    return weather;
  }
}
