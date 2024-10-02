import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class AlcoholTestTypeResp implements AbstratDataSelectDataOms{
  int? code;
  int? id;
  String? value;

  AlcoholTestTypeResp({this.code, this.id, this.value});

  @override
  String toString() {
    return 'AlcoholTestTypeResp(code: $code, id: $id, value: $value)';
  }

  factory AlcoholTestTypeResp.fromMap(Map<String, dynamic> data) {
    return AlcoholTestTypeResp(
      code: data['code'] as int?,
      id: data['id'] as int?,
      value: data['value'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'code': code,
        'id': id,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AlcoholTestTypeResp].
  factory AlcoholTestTypeResp.fromJson(String data) {
    return AlcoholTestTypeResp.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AlcoholTestTypeResp] to a JSON string.
  String toJson() => json.encode(toMap());

  AlcoholTestTypeResp copyWith({
    int? code,
    int? id,
    String? value,
  }) {
    return AlcoholTestTypeResp(
      code: code ?? this.code,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AlcoholTestTypeResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ value.hashCode;
}
