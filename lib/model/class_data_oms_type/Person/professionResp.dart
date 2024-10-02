
import 'dart:convert';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';


class ProfessionResp implements AbstratDataSelectDataOms{

  int? id;
  String? name;
  String? value;

  ProfessionResp({this.id, this.name, this.value}){
    value == null ?  value = name : value= value;
  }


  //------------ Les Methodes par defaut d une class Model ----------------

  factory ProfessionResp.fromJson(Map<String, dynamic> json) {
    return ProfessionResp(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ProfessionResp.fromString(String jsonString) {
    return ProfessionResp.fromJson(json.decode(jsonString));
  }

  String toString() {
    return json.encode(toJson());
  }

  ProfessionResp copyWith({
    int? id,
    String? name,
  }) {
    return ProfessionResp(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfessionResp &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

}