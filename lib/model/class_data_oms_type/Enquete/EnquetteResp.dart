
import 'dart:convert';

class EnquetteRequest{

  int? id;
  String? accidentDate;
  String? accidentTime;
  String? municipality;
  double? latitude;
  double? longitude;
  String? place;
  int? road;
  String? roadType;
  String? roadCategory;
  int? speedLimit;
  int? block;
  int? roadState;
  int? roadIntersection;
  int? roadTrafficControl;
  int? virage;
  int? roadSlopSection;
  int? accidentType;
  int? impactType;
  int? climaticCondition;
  int? brightnessCondition;
  String? accidentSeverity;
  List<Map<String, dynamic>?>? vehicules;
  List<Map<String, dynamic>?>? persons;
  String? city;
  String? status;
  String? statusRequest;
  List<Map<String, dynamic>?>? causes;
  List<Map<String, dynamic>?>? crashImages;
  Map<String, dynamic>? drawing;

  EnquetteRequest({
    this.id,
    this.accidentDate,
    this.accidentTime,
    this.municipality,
    this.latitude,
    this.longitude,
    this.place,
    this.road,
    this.roadType,
    this.roadCategory,
    this.speedLimit,
    this.block,
    this.roadState,
    this.roadIntersection,
    this.roadTrafficControl,
    this.virage,
    this.roadSlopSection,
    this.accidentType,
    this.impactType,
    this.climaticCondition,
    this.brightnessCondition,
    this.accidentSeverity,
    this.vehicules,
    this.persons,
    this.city,
    this.status,
    this.statusRequest,
    this.causes,
    this.crashImages,
    this.drawing,
  });

  factory EnquetteRequest.fromJson(Map<String, dynamic>? json) => EnquetteRequest(

    id: json?['id'],
    accidentDate: json?['accidentDate'],
    accidentTime: json?['accidentTime'],
    municipality: json?['municipality'],
    latitude: json?['latitude'],
    longitude: json?['longitude'],
    place: json?['place'],
    road: json?['road'],
    roadType: json?['roadType'],
    roadCategory: json?['roadCategory'],
    speedLimit: json?['speedLimit'],
    block: json?['block'],
    roadState: json?['roadState'],
    roadIntersection: json?['roadIntersection'],
    roadTrafficControl: json?['roadTrafficControl'],
    virage: json?['virage'],
    roadSlopSection: json?['roadSlopSection'],
    accidentType: json?['accidentType'],
    impactType: json?['impactType'],
    climaticCondition: json?['climaticCondition'],
    brightnessCondition: json?['brightnessCondition'],
    accidentSeverity: json?['accidentSeverity'],
    vehicules: json?['vehicules'],
    persons: json?['persons'],
    city: json?['city'],
    status: json?['status'],
    statusRequest: json?['statusRequest'],
    causes: json?['causes'],
    crashImages: json?['crashImages'],
    drawing: json?['drawing'],
  );


  Map<String, dynamic> toJson() => {
    'id': id,
    'accidentDate': accidentDate,
    'accidentTime': accidentTime,
    'municipality': municipality,
    'latitude': latitude,
    'longitude': longitude,
    'place': place,
    'road': road,
    'roadType': roadType,
    'roadCategory': roadCategory,
    'speedLimit': speedLimit,
    'block': block,
    'roadState': roadState,
    'roadIntersection': roadIntersection,
    'roadTrafficControl': roadTrafficControl,
    'virage': virage,
    'roadSlopSection': roadSlopSection,
    'accidentType': accidentType,
    'impactType': impactType,
    'climaticCondition': climaticCondition,
    'brightnessCondition': brightnessCondition,
    'accidentSeverity': accidentSeverity,
    'vehicules': vehicules,
    'persons': persons,
    'city': city,
    'status': status,
    'statusRequest': statusRequest,
    'causes': causes,
    'crashImages': crashImages,
    'drawing': drawing,
  };



  EnquetteRequest copyWith({
    int? id,
    String? accidentDate,
    String? accidentTime,
    String? municipality,
    double? latitude,
    double? longitude,
    String? place,
    int? road,
    String? roadType,
    String? roadCategory,
    int? speedLimit,
    int? block,
    int? roadState,
    int? roadIntersection,
    int? roadTrafficControl,
    int? virage,
    int? roadSlopSection,
    int? accidentType,
    int? impactType,
    int? climaticCondition,
    int? brightnessCondition,
    String? accidentSeverity,
    List<Map<String, dynamic>?>? vehicules,
    List<Map<String, dynamic>?>? persons,
    String? city,
    String? status,
    String? statusRequest,
    List<Map<String, dynamic>?>? causes,
    List<Map<String, dynamic>?>? crashImages,
    Map<String, dynamic>? drawing,
  }) =>
      EnquetteRequest(
        id: id ?? this.id,
        accidentDate: accidentDate ?? this.accidentDate,
        accidentTime: accidentTime ?? this.accidentTime,
        municipality: municipality ?? this.municipality,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        place: place ?? this.place,
        road: road ?? this.road,
        roadType: roadType ?? this.roadType,
        roadCategory: roadCategory ?? this.roadCategory,
        speedLimit: speedLimit ?? this.speedLimit,
        block: block ?? this.block,
        roadState: roadState ?? this.roadState,
        roadIntersection: roadIntersection ?? this.roadIntersection,
        roadTrafficControl: roadTrafficControl ?? this.roadTrafficControl,
        virage: virage ?? this.virage,
        roadSlopSection: roadSlopSection ?? this.roadSlopSection,
        accidentType: accidentType ?? this.accidentType,
        impactType: impactType ?? this.impactType,
        climaticCondition: climaticCondition ?? this.climaticCondition,
        brightnessCondition: brightnessCondition ?? this.brightnessCondition,
        accidentSeverity: accidentSeverity ?? this.accidentSeverity,
        vehicules: vehicules ?? this.vehicules,
        persons: persons ?? this.persons,
        city: city ?? this.city,
        status: status ?? this.status,
        statusRequest: statusRequest ?? this.statusRequest,
        causes: causes ?? this.causes,
        crashImages: crashImages ?? this.crashImages,
        drawing: drawing ?? this.drawing,
      );





  factory EnquetteRequest.fromString(String jsonString) =>
      EnquetteRequest.fromJson(json.decode(jsonString));

  String toString() => json.encode(toJson());


  static List<EnquetteRequest>? listFromJson(List<dynamic>? json) =>
      json?.map((enquetteRequest) => EnquetteRequest.fromJson(enquetteRequest)).toList();

  static List<Map<String, dynamic>> listToJson(List<EnquetteRequest> enquetteRequests) =>
      enquetteRequests.map((enquetteRequest) => enquetteRequest.toJson()).toList();


}
