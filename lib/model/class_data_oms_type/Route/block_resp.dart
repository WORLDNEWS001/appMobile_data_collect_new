import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class BlockResp implements AbstratDataSelectDataOms{
  int? code;
  int? id;
  String? value;

  BlockResp({this.code, this.id, this.value});

  @override
  String toString() => 'BlockResp(code: $code, id: $id, value: $value)';

  factory BlockResp.fromMap(Map<String, dynamic> data) => BlockResp(
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
  /// Parses the string and returns the resulting Json object as [BlockResp].
  factory BlockResp.fromJson(String data) {
    return BlockResp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BlockResp] to a JSON string.
  String toJson() => json.encode(toMap());

  BlockResp copyWith({
    int? code,
    int? id,
    String? value,
  }) {
    return BlockResp(
      code: code ?? this.code,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BlockResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ value.hashCode;
}
