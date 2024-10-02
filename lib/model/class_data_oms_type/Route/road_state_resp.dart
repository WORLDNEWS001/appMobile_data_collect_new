import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class RoadStateResp implements AbstratDataSelectDataOms{
  int? code;
  int? id;
  String? value;

  RoadStateResp({this.code, this.id, this.value});

  @override
  String toString() => 'RoadStateResp(code: $code, id: $id, value: $value)';

  factory RoadStateResp.fromMap(Map<String, dynamic> data) => RoadStateResp(
        code: data['code'] as int?,
        id: data['id'] as int?,
        value: data['value'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'code': code,
        'id': id,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RoadStateResp].
  factory RoadStateResp.fromJson(String data) {
    return RoadStateResp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RoadStateResp] to a JSON string.
  String toJson() => json.encode(toMap());

  RoadStateResp copyWith({
    int? code,
    int? id,
    String? value,
  }) {
    return RoadStateResp(
      code: code ?? this.code,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RoadStateResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ value.hashCode;
}
