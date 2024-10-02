import 'dart:convert';

import 'package:secondtest/model/Class_setting/role.dart';

class User {
  final String username;
  final String password;
  final Role role;

  User({required this.username, required this.role, required this.password});

  //----------les 5 methode comme dans d'autre class ----------------
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      role: Role.fromJson(json['role']),
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'role': role.toJson(),
      'password': password,
    };
  }

  factory User.fromString(String jsonString) {
    return User.fromJson(json.decode(jsonString));
  }

  String toString() {
    return json.encode(toJson());
  }

  User copyWith({
    String? username,
    Role? role,
    String? password,
  }) {
    return User(
      username: username ?? this.username,
      role: role ?? this.role,
      password: password ?? this.password,
    );
  }

}