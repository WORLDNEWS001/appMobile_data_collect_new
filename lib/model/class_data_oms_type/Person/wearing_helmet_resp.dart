import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class WearingHelmetResp implements AbstratDataSelectDataOms{
  int? code;
  int? id;
  String? value;

  WearingHelmetResp({this.code, this.id, this.value});

  @override
  String toString() {
    return 'WearingHelmetResp(code: $code, id: $id, value: $value)';
  }

  factory WearingHelmetResp.fromMap(Map<String, dynamic> data) {
    return WearingHelmetResp(
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
  /// Parses the string and returns the resulting Json object as [WearingHelmetResp].
  factory WearingHelmetResp.fromJson(String data) {
    return WearingHelmetResp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WearingHelmetResp] to a JSON string.
  String toJson() => json.encode(toMap());

  WearingHelmetResp copyWith({
    int? code,
    int? id,
    String? value,
  }) {
    return WearingHelmetResp(
      code: code ?? this.code,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! WearingHelmetResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ value.hashCode;
}
