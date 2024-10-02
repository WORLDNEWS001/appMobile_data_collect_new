import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class MunicipalityResp implements AbstratDataSelectDataOms{
  String? code;
  int? id;
  String? name;

  MunicipalityResp({this.code, this.id, this.name});

  // Ajoutez une implémentation factice pour 'value'
  @override
  String? get value => name;

  @override
  String toString() => 'MunicipalityResp(code: $code, id: $id, name: $name)';

  factory MunicipalityResp.fromMap(Map<String, dynamic> data) {
    return MunicipalityResp(
      code: data['code'] as String?,
      id: data['id'] as int?,
      name: data['name'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'code': code,
        'id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MunicipalityResp].
  factory MunicipalityResp.fromJson(String data) {
    return MunicipalityResp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MunicipalityResp] to a JSON string.
  String toJson() => json.encode(toMap());

  MunicipalityResp copyWith({
    String? code,
    int? id,
    String? name,
  }) {
    return MunicipalityResp(
      code: code ?? this.code,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MunicipalityResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => code.hashCode ^ id.hashCode ^ name.hashCode;
}
