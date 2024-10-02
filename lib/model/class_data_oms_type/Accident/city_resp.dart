import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

class CityResp implements AbstratDataSelectDataOms {
  int? id;
  String? name;

  CityResp({this.id, this.name});

  // Ajoutez une implémentation factice pour 'value'
  @override
  String? get value => name;




  @override
  String toString() => 'CityResp(id: $id, name: $name)';

  factory CityResp.fromMap(Map<String, dynamic> data) => CityResp(
        id: data['id'] as int?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CityResp].
  factory CityResp.fromJson(String data) {
    return CityResp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CityResp] to a JSON string.
  String toJson() => json.encode(toMap());

  CityResp copyWith({
    int? id,
    String? name,
  }) {
    return CityResp(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CityResp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
