import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class AlcoholTestResultResp implements AbstratDataSelectDataOms{
  String? code;
  int? id;
  String? value;

  AlcoholTestResultResp({this.code, this.id, this.value});

  @override
  String toString() {
    return 'AlcoholTestResultResp(code: $code, id: $id, value: $value)';
  }

  factory AlcoholTestResultResp.fromMap(Map<String, dynamic> data) {
    return AlcoholTestResultResp(
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
  /// Parses the string and returns the resulting Json object as [AlcoholTestResultResp].
  factory AlcoholTestResultResp.fromJson(String data) {
    return AlcoholTestResultResp.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AlcoholTestResultResp] to a JSON string.
  String toJson() => json.encode(toMap());

  AlcoholTestResultResp copyWith({
    String? code,
    int? id,
    String? value,
  }) {
    return AlcoholTestResultResp(
      code: code ?? this.code,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AlcoholTestResultResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ value.hashCode;
}
