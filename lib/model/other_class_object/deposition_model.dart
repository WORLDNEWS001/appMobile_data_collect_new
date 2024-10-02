import 'dart:convert';

class Deposition {
  String? identityPerson;
  String? deposition;
  int? accidentId;

  Deposition({
    this.identityPerson,
    this.deposition,
    this.accidentId,
  });

  // Factory constructor to create an instance from JSON
  factory Deposition.fromJson(Map<String, dynamic> json) => Deposition(
    identityPerson: json['identityPerson'] as String?,
    deposition: json['deposition'] as String?,
    accidentId: json['accidentId'] as int?,
  );

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => {
    'identityPerson': identityPerson,
    'deposition': deposition,
    'accidentId': accidentId,
  };

  //-- create interface Map<String, dynamic> to send data to server
  Map<String, dynamic> toJson_send_api() => {
    'textField': identityPerson,
    'textArea': deposition,
    'accident_id': accidentId,
  };

  // Factory constructor to create an instance from a JSON string
  factory Deposition.fromString(String jsonString) =>
      Deposition.fromJson(json.decode(jsonString));

  // Method to convert an instance to a JSON string
  @override
  String toString() => json.encode(toJson());

  // Method to create a copy of the current instance with optional new values
  Deposition copyWith({
    String? identityPerson,
    String? deposition,
    int? accidentId,
  }) =>
      Deposition(
        identityPerson: identityPerson ?? this.identityPerson,
        deposition: deposition ?? this.deposition,
        accidentId: accidentId ?? this.accidentId,
      );

  // Static method to create a list of Deposition from a list of JSON
  static List<Deposition> listFromJson(List<dynamic> json) =>
      json.map((item) => Deposition.fromJson(item)).toList();

  // Static method to convert a list of Deposition to JSON
  static List<Map<String, dynamic>> listToJson(List<Deposition> depositions) =>
      depositions.map((item) => item.toJson()).toList();
}

