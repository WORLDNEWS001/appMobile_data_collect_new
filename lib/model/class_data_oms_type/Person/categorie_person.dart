
import 'dart:convert';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';


class CategoriePerson implements AbstratDataSelectDataOms {

  int? id;
  String? name;
  String? value;

  CategoriePerson({this.id, this.name, this.value});

  //------ Methode FromJson avec code, id , et value
  factory CategoriePerson.fromJson(Map<String, dynamic> json) {
    return CategoriePerson(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }

  //------ Methode FromJson avec code, id , et value
  factory CategoriePerson.fromMap(Map<String, dynamic>? json) {
    return CategoriePerson(
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
  factory CategoriePerson.fromString(String jsonString) {
    return CategoriePerson.fromJson(json.decode(jsonString));
  }

  //------ Methode toString avec code, id , et value
  String toString() {
    return json.encode(toJson());
  }

  //------ Methode copyWith avec code, id , et value
  CategoriePerson copyWith({
    int? id,
    String? name,
    String? value,
  }) {
    return CategoriePerson(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  //------ Methode operator == avec code, id , et value
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CategoriePerson &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              value == other.value;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

}