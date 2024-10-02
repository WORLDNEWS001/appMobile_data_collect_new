import 'dart:convert';

import 'package:secondtest/VariableData.dart';
import 'package:secondtest/services/enquete/images_crash_enquete/MethodeAddImageCrashEnquete.dart';

class Images {
  String? path;
  String? name;

  Images({
    this.path,
    this.name,
  }) {}

  factory Images.fromJson(Map<String, dynamic>? json) {
    return Images(
      path: json?['path'],
      name: json?['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'name': name,
    };
  }

  factory Images.fromString(String jsonString) {
    return Images.fromJson(json.decode(jsonString));
  }

  String toString() {
    return json.encode(toJson());
  }

  Images copyWith({
    String? path,
    String? name,
  }) {
    return Images(
      path: path ?? this.path,
      name: name ?? this.name,
    );
  }
}