class Weather {
  final List<String> time;
  final List<double> temperature;
  final List<int> weatherCode;

  Weather({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      time: List<String>.from(json['time']),
      temperature: List<double>.from(json['temperature_2m']),
      weatherCode: List<int>.from(json['weather_code']),
    );
  }
}
