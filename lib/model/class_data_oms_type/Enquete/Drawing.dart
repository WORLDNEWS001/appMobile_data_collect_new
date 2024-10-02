
import 'dart:convert';

class DrawingResp {
  final String? name;
  final String? path;

  DrawingResp({
    required this.name,
    required this.path,
  });

  factory DrawingResp.fromJson(Map<String, dynamic>? json) => DrawingResp(
    name: json?['name'],
    path: json?['path'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'path': path,
  };

  factory DrawingResp.fromString(String jsonString) =>
      DrawingResp.fromJson(json.decode(jsonString));

  String toString() => json.encode(toJson());
}