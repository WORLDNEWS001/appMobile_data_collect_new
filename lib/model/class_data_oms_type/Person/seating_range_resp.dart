import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class SeatingRangeResp implements AbstratDataSelectDataOms{
  int? code;
  int? id;
  String? value;

  SeatingRangeResp({this.code, this.id, this.value});

  @override
  String toString() {
    return 'SeatingRangeResp(code: $code, id: $id, value: $value)';
  }

  factory SeatingRangeResp.fromMap(Map<String, dynamic> data) {
    return SeatingRangeResp(
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
  /// Parses the string and returns the resulting Json object as [SeatingRangeResp].
  factory SeatingRangeResp.fromJson(String data) {
    return SeatingRangeResp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SeatingRangeResp] to a JSON string.
  String toJson() => json.encode(toMap());

  SeatingRangeResp copyWith({
    int? code,
    int? id,
    String? value,
  }) {
    return SeatingRangeResp(
      code: code ?? this.code,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SeatingRangeResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ value.hashCode;
}
