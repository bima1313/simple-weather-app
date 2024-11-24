class Coordinate {
  final String latitude;
  final String longitude;

  Coordinate({required this.latitude, required this.longitude});

  factory Coordinate.sendCoordinate(String latitude, String longitude) {
    return Coordinate(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
