import 'dart:convert';

class Role {
  final String name;
  final List<String> permissions;

  Role({required this.name, required this.permissions});



  //---------- les 5 methode comme dans d'autre class ----------------

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      name: json['name'],
      permissions: List<String>.from(json['permissions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'permissions': permissions,
    };
  }

  factory Role.fromString(String jsonString) {
    return Role.fromJson(json.decode(jsonString));
  }

  String toString() {
    return json.encode(toJson());
  }

  Role copyWith({
    String? name,
    List<String>? permissions,
  }) {
    return Role(
      name: name ?? this.name,
      permissions: permissions ?? this.permissions,
    );
  }



}