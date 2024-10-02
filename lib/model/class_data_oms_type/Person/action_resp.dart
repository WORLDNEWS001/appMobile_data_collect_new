
import 'dart:convert';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';


class ActionResp implements AbstratDataSelectDataOms {

  int? id;
  String? name;
  String? value;

  ActionResp({this.id, this.name, this.value});

  //------ Methode FromJson avec code, id , et value
  factory ActionResp.fromJson(Map<String, dynamic> json) {
    return ActionResp(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }

  //------ Methode FromJson avec code, id , et value
  factory ActionResp.fromMap(Map<String, dynamic>? json) {
    return ActionResp(
      id: json?['id'],
      name: json?['name'],
      value: json?['value'],
    );
  }

  //------ Methode toJson avec code, id , et value
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }

  //------ Methode fromString avec code, id , et value
  factory ActionResp.fromString(String jsonString) {
    return ActionResp.fromJson(json.decode(jsonString));
  }

  //------ Methode toString avec code, id , et value
  String toString() {
    return json.encode(toJson());
  }

  //------ Methode copyWith avec code, id , et value
  ActionResp copyWith({
    int? id,
    String? name,
    String? value,
  }) {
    return ActionResp(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  //------ Methode operator == avec code, id , et value
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActionResp &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          value == other.value;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

}