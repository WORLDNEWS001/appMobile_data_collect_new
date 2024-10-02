import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class AccidentSeverityResp implements AbstratDataSelectDataOms {
  String? code;
  String? description;
  int? id;
  String? value;

  AccidentSeverityResp({this.code, this.description, this.id, this.value});

  @override
  String toString() {
    return 'AccidentSeverityResp(code: $code, description: $description, id: $id, value: $value)';
  }

  factory AccidentSeverityResp.fromMap(Map<String, dynamic> data) {
    return AccidentSeverityResp(
      code: data['code'] as String?,
      description: data['description'] as String?,
      id: data['id'] as int?,
      value: data['value'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'code': code,
        'description': description,
        'id': id,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AccidentSeverityResp].
  factory AccidentSeverityResp.fromJson(String data) {
    return AccidentSeverityResp.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AccidentSeverityResp] to a JSON string.
  String toJson() => json.encode(toMap());

  AccidentSeverityResp copyWith({
    String? code,
    String? description,
    int? id,
    String? value,
  }) {
    return AccidentSeverityResp(
      code: code ?? this.code,
      description: description ?? this.description,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AccidentSeverityResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      code.hashCode ^ description.hashCode ^ id.hashCode ^ value.hashCode;
}
