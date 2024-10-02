

//----------- create class vehicule image ------------

import 'dart:convert';

class VehiculeImageResp {

  final String? path;
  final String? name;

  VehiculeImageResp({
    required this.path,
    required this.name,
  });

  //----------------- les 5 methode comme dans d'autre class ----------------

  factory VehiculeImageResp.fromJson(Map<String, dynamic>? json) => VehiculeImageResp(
    path: json?['path'],
    name: json?['name'],
  );

  //--- methode to json
  Map<String, dynamic> toJson() => {
    'path': path,
    'name': name,
  };

  //--- methode from string
  factory VehiculeImageResp.fromString(String jsonString) =>
      VehiculeImageResp.fromJson(json.decode(jsonString));

  //--- methode to string
  String toString() => json.encode(toJson());

}
