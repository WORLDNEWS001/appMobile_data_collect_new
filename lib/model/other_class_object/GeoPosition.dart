import 'dart:convert';

class GeoPosition {
  String? city;
  String? street;
  double? lat;
  double? lon;
  double? altitude;

  GeoPosition({
    this.city,
    this.street,
    required this.lat,
    required this.lon,
    this.altitude,
  });

  factory GeoPosition.fromJson(Map<String, dynamic> json) => GeoPosition(
    city: json['city'] ?? 'Default City',
    street: json['street'] ?? 'Default Street',
    lat: json['lat'] ?? 0.0,
    lon: json['lon'] ?? 0.0,
    altitude: json['altitude'] ?? 0.0
  );

  Map<String, dynamic> toJson() => {
        'city': city,
        'street': street,
        'lat': lat,
        'lon': lon,
        'altitude': altitude,
      };

  factory GeoPosition.fromString(String jsonString) =>
      GeoPosition.fromJson(json.decode(jsonString));

  String toString() => json.encode(toJson());

  GeoPosition copyWith({
    String? city,
    String? street,
    double? lat,
    double? lon,
    double? altitude,
  }) =>
      GeoPosition(
        city: city ?? this.city,
        street: street ?? this.street,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        altitude: altitude ?? this.altitude,
      );

  static List<GeoPosition> listFromJson(List<dynamic> json) =>
      json.map((position) => GeoPosition.fromJson(position)).toList();

  static List<Map<String, dynamic>> listToJson(List<GeoPosition> positions) =>
      positions.map((position) => position.toJson()).toList();


}