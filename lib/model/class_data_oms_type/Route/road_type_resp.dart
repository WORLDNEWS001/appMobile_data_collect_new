import 'dart:convert';

import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class RoadTypeResp implements AbstratDataSelectDataOms {
  int? code;
  int? id;
  String? value;

  RoadTypeResp({this.code, this.id, this.value});

// Autres membres et méthodes de la classe...

  //---- methode FromJson
  factory RoadTypeResp.fromJson(Map<String, dynamic> json) {
    return RoadTypeResp(
      code: json['code'] as int?,
      id: json['id'] as int?,
      value: json['value'] as String?,
    );
  }

  //------ Methode toJson
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'id': id,
      'value': value,
    };
  }




  //---- methode toString
  factory RoadTypeResp.fromString(String jsonString) {
    return RoadTypeResp.fromJson(json.decode(jsonString));
  }

  //---- methode toString
  String toString() {
    return json.encode(toJson());
  }

  //----- create methode list Map to List RoadTypeResp
  static List<RoadTypeResp> listFromJson(List<dynamic> json) {
    return json.map((roadTypeResp) => RoadTypeResp.fromJson(roadTypeResp)).toList();
  }



}