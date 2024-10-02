
//------  create class direct cause resp avec les methode par defaut ------------
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

import 'dart:convert';

class DirectCauseResp implements AbstratDataSelectDataOms {

  final int? id;
  final String? name;

  DirectCauseResp({
    required this.id,
    required this.name,
  });


  // Ajoutez une implémentation factice pour 'value'
  @override
  String? get value => name;


  factory DirectCauseResp.fromJson(Map<String, dynamic> json) => DirectCauseResp(
    id: json['id'],
    name: json['name'],
  );

  factory DirectCauseResp.fromMap(Map<String, dynamic> json) => DirectCauseResp(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };

  factory DirectCauseResp.fromString(String jsonString) =>
      DirectCauseResp.fromJson(json.decode(jsonString));

  String toString() => json.encode(toJson());

}