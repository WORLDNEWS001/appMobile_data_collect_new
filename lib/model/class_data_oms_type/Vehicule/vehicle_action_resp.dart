import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class VehicleActionResp implements AbstratDataSelectDataOms {
  final int? code;
  final int? id;
  final String? value;

  VehicleActionResp({
    required this.code,
    required this.id,
    required this.value,
  });

  factory VehicleActionResp.fromJson(Map<String, dynamic> json) => VehicleActionResp(
    code: json['code'],
    id: json['id'],
    value: json['value'],
  );


  factory VehicleActionResp.fromMap(Map<String, dynamic> json) => VehicleActionResp(
    code: json['code'],
    id: json['id'],
    value: json['value'],
  );



  Map<String, dynamic> toJson() => {
    'code': code,
    'id': id,
    'value': value,
  };


  factory VehicleActionResp.fromString(String jsonString) =>
      VehicleActionResp.fromJson(json.decode(jsonString));

  String toString() => json.encode(toJson());

  //------- methode copyWith
  VehicleActionResp copyWith({
    int? code,
    int? id,
    String? value,
  }) {
    return VehicleActionResp(
      code: code ?? this.code,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VehicleActionResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ value.hashCode;
}
