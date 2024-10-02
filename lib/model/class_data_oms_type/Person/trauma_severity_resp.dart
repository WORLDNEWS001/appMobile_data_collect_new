import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class TraumaSeverityResp implements AbstratDataSelectDataOms {
  String? code;
  int? id;
  String? value;

  TraumaSeverityResp({this.code, this.id, this.value});

  @override
  String toString() {
    return 'TraumaSeverityResp(code: $code, id: $id, value: $value)';
  }

  factory TraumaSeverityResp.fromMap(Map<String, dynamic> data) {
    return TraumaSeverityResp(
      code: data['code'] as String?,
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
  /// Parses the string and returns the resulting Json object as [TraumaSeverityResp].
  factory TraumaSeverityResp.fromJson(String data) {
    return TraumaSeverityResp.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TraumaSeverityResp] to a JSON string.
  String toJson() => json.encode(toMap());

  TraumaSeverityResp copyWith({
    String? code,
    int? id,
    String? value,
  }) {
    return TraumaSeverityResp(
      code: code ?? this.code,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TraumaSeverityResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ value.hashCode;
}
