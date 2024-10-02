import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class RoadCategoryResp implements AbstratDataSelectDataOms{
  int? code;
  int? id;
  String? name;
  String? value;

  RoadCategoryResp({this.code, this.id, this.name, this.value}){
    value == null ?  value = name : value= value;
  }



  @override
  String toString() {
    return 'RoadCategoryResp(code: $code, id: $id, name: $name, value: $value)';
  }

  factory RoadCategoryResp.fromMap(Map<String, dynamic> data) {
    return RoadCategoryResp(
      code: data['code'] as int?,
      id: data['id'] as int?,
      name: data['name'] as String?,
      value: data['value'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'code': code,
        'id': id,
        'name': name,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RoadCategoryResp].
  factory RoadCategoryResp.fromJson(String data) {
    return RoadCategoryResp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RoadCategoryResp] to a JSON string.
  String toJson() => json.encode(toMap());

  RoadCategoryResp copyWith({
    int? code,
    int? id,
    String? name,
    String? value,
  }) {
    return RoadCategoryResp(
      code: code ?? this.code,
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RoadCategoryResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      code.hashCode ^ id.hashCode ^ name.hashCode ^ value.hashCode;
}
