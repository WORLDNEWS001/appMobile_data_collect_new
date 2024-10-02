
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Images.dart';
import 'package:secondtest/model/class_data_oms_type/Person/action_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_consumption_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_test_result_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_test_status_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_test_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/gender_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/occupant_restraint_system_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/person_drug_use_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/person_road_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/professionResp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/seating_place_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/seating_range_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/trauma_severity_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/wearing_helmet_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_type_resp.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';

class PersonResp {
  int? id;
  String? typePerson;
  String? firstName;
  String? lastName;
  String? cni;
  String? telephone;
  int? personAccidentNumber;
  int? vehicleAccidentNumber;
  int? vehicleLinkedPedestrian;
  String? birthDate;
  GenderResp? gender;
  PersonRoadTypeResp? roadType;
  SeatingRangeResp? range;
  SeatingPlaceResp? place;
  TraumaSeverityResp? traumaSeverity;
  WearingHelmetResp? wearingHelmet;
  OccupantRestraintSystemResp? occupantRestraintSystem;
  ActionResp? personAction;
  AlcoholConsumptionResp? alcoholConsumption;
  AlcoholTestStatusResp? testStatus;
  AlcoholTestTypeResp? testType;
  AlcoholTestResultResp? testResult;
  PersonDrugUseResp? drugUse;
  String? drivingLicenceYear;
  int? care;
  int? personId;
  List<Images?>? images;
  ProfessionResp? profession;
  String? nopermis;
  int? typepermis;
  String? dateCreate;
  String? StatusRequest;
  int? vgt_id;
  int? originalIndex;
  String? types;

  PersonResp({
    this.id,
    this.typePerson,
    this.firstName,
    this.lastName,
    this.cni,
    this.telephone,
    this.personAccidentNumber,
    this.vehicleAccidentNumber,
    this.vehicleLinkedPedestrian,
    this.birthDate,
    this.gender,
    this.roadType,
    this.range,
    this.place,
    this.traumaSeverity,
    this.wearingHelmet,
    this.occupantRestraintSystem,
    this.personAction,
    this.alcoholConsumption,
    this.testStatus,
    this.testType,
    this.testResult,
    this.drugUse,
    this.drivingLicenceYear,
    this.care,
    this.personId,
    this.images,
    this.profession,
    this.nopermis,
    this.typepermis,
    this.dateCreate,
    this.StatusRequest,
    this.vgt_id,
    this.originalIndex,
    this.types,
  });

factory PersonResp.fromJson(Map<String, dynamic>? json) {
  return PersonResp(
    id: json?['id'],
    firstName: json?['firstName'],
    lastName: json?['lastName'],
    cni: json?['cni'],
    telephone: json?['telephone'],
    personAccidentNumber: json?['personAccidentNumber'],
      vehicleAccidentNumber: json?['vehicleAccidentNumber'],
      vehicleLinkedPedestrian: json?['vehicleLinkedPedestrian'],
      birthDate: json?['birthDate'],
      gender: GenderResp.fromJson(json?['gender']),
      roadType: PersonRoadTypeResp.fromJson(json?['roadType']),
      range: SeatingRangeResp.fromJson(json?['range']),
      place: SeatingPlaceResp.fromJson(json?['place']),
      traumaSeverity: TraumaSeverityResp.fromJson(json?['traumaSeverity']),
      wearingHelmet: WearingHelmetResp.fromJson(json?['wearingHelmet']),
      occupantRestraintSystem: OccupantRestraintSystemResp.fromJson(json?['occupantRestraintSystem']),
      personAction: ActionResp.fromJson(json?['personAction']),
      alcoholConsumption: AlcoholConsumptionResp.fromJson(json?['alcoholConsumption']),
      testStatus: AlcoholTestStatusResp.fromJson(json?['testStatus']),
      testType: AlcoholTestTypeResp.fromJson(json?['testType']),
      testResult: AlcoholTestResultResp.fromJson(json?['testResult']),
      drugUse: PersonDrugUseResp.fromJson(json?['drugUse']),
      drivingLicenceYear: json?['drivingLicenceYear'],
      care: json?['care'],
      personId: json?['personId'],
      images: (json?['images'] as List).map((i) => Images.fromJson(i)).toList(),
      profession: ProfessionResp.fromJson(json?['profession']),
      nopermis: json?['nopermis'],
    typepermis: json?['typepermis'],
    dateCreate: json?['dateCreate'],
    StatusRequest: json?['StatusRequest'],
    vgt_id: json?['vgt_id'],
    originalIndex: json?['originalIndex'],
    types: json?['types'],

  );
}



  factory PersonResp.fromJsonRequest(Map<String, dynamic>? json, BuildContext context) {
    DataOmsSelectProvider StateProviderData = context.read<DataOmsSelectProvider>();

    //print("\n\n\n------ Data Json is : $json -----\n");
    //print("\n\n\n pendant le chargement des donnees Map en personn nous avons le testStatus: ${StateProviderData.getAlcoholTestStatusRespById(json?['testStatus'])} \n\n\n ");

    return PersonResp(
      id: json?['id'],
      firstName: json?['firstName'],
      lastName: json?['lastName'],
      cni: json?['cni'],
      telephone: json?['telephone'],
      personAccidentNumber: json?['personAccidentNumber'],
      vehicleAccidentNumber: json?['vehicleAccidentNumber'],
      vehicleLinkedPedestrian: json?['vehicleLinkedPedestrian'],
      birthDate: json?['birthDate'],
      gender: StateProviderData.getGenderRespById(json?['gender']),
      roadType: StateProviderData.getPersonRoadTypeRespById(json?['roadType']),
      range: StateProviderData.getSeatingRangeRespById(json?['range']),
      place: StateProviderData.getSeatingPlaceRespById(json?['place']),
      traumaSeverity: StateProviderData.getTraumaSeverityRespById(json?['traumaSeverity']),
      wearingHelmet: StateProviderData.getWearingHelmetRespById(json?['wearingHelmet']),
      occupantRestraintSystem: StateProviderData.getOccupantRestraintSystemRespById(json?['occupantRestraintSystem']),
      personAction: StateProviderData.getActionRespById(json?['personAction']),
      alcoholConsumption: StateProviderData.getAlcoholConsumptionRespById(json?['alcoholConsumption']),
      testStatus: StateProviderData.getAlcoholTestStatusRespById(json?['testStatus']),
      testType: StateProviderData.getAlcoholTestTypeRespById(json?['testType']),
      testResult: StateProviderData.getAlcoholTestResultRespById(json?['testResult']),
      drugUse: StateProviderData.getPersonDrugUseRespById(json?['drugUse']),
      drivingLicenceYear: json?['drivingLicenceYear'],
      care: json?['care'],
      personId: json?['personId'],
      images: (json?['images'] as List<dynamic>?)?.map((item) => Images.fromJson(item as Map<String, dynamic>)).toList(),
      profession: StateProviderData.getProfessionRespById(json?['profession']),
      nopermis: json?['nopermis'],
      typepermis: json?['typepermis'],
      dateCreate: json?['dateCreate'],
      StatusRequest: json?['StatusRequest'],
      vgt_id: json?['vgt_id'],
      originalIndex: json?['originalIndex'],
      types: json?['types'],


    );
  }


  Map<String, dynamic> toJson_alldata() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'cni': cni,
      'telephone': telephone,
      'personAccidentNumber': personAccidentNumber,
      'vehicleAccidentNumber': vehicleAccidentNumber,
      'vehicleLinkedPedestrian': vehicleLinkedPedestrian,
      'birthDate': birthDate,
      'gender': gender?.toJson(),
    'roadType': roadType?.toJson(),
    'range': range?.toJson(),
    'place': place?.toJson(),
    'traumaSeverity': traumaSeverity?.toJson(),
    'wearingHelmet': wearingHelmet?.toJson(),
    'occupantRestraintSystem': occupantRestraintSystem?.toJson(),
    'personAction': personAction,
    'alcoholConsumption': alcoholConsumption?.toJson(),
    'testStatus': testStatus?.toJson(),
    'testType': testType?.toJson(),
    'testResult': testResult?.toJson(),
    'drugUse': drugUse?.toJson(),
    'drivingLicenceYear': drivingLicenceYear,
    'care': care,
    'personId': personId,
    'images': images?.map((i) => i?.toJson()).toList(),
    'profession': profession?.toJson(),
    'nopermis': nopermis,
      'typepermis': typepermis,
      'dateCreate': dateCreate,
      'StatusRequest': StatusRequest,
      'vgt_id': vgt_id,
      'originalIndex': originalIndex,
      'types': types,
    };
  }

  Map<String, dynamic> toJson_old_old() {

        Map<String, dynamic> data = {
                //'cni': cni,
                //'telephone': telephone,

                'roadType': roadType?.id, // -- OK
                'place': place?.id, // -- OK
                'range': range?.id, // -- OK
                'wearingHelmet': wearingHelmet?.id, // -- OK
                'occupantRestraintSystem': occupantRestraintSystem?.id, // -- OK

                'testStatus': testStatus?.id ?? 1, // -- OK

                'testType': testType?.id ?? 1, // -- OK
                'testResult': testResult?.id ?? 1, // -- OK

                'traumaSeverity': traumaSeverity?.id, // -- OK
                'alcoholConsumption': alcoholConsumption?.id, // -- OK
                'gender': gender?.id, // -- OK
                'drugUse': drugUse?.id ?? 1, // -- OK
                'profession': profession?.id ?? 1, // -- OK
                'personAction': personAction?.id ?? 1, // -- OK
                'personAccidentNumber': personAccidentNumber ?? 0, // -- OK
                'vehicleAccidentNumber': vehicleAccidentNumber ?? 0, // -- OK
                'vehicleLinkedPedestrian': vehicleLinkedPedestrian ?? 0, // -- OK
                'firstName': firstName, // -- OK
                'lastName': lastName, // -- OK
                'birthDate': GlobalMethod.convertirDateFrancais(birthDate), // -- OK

                //'drivingLicenceYear': drivingLicenceYear, // -- OK
                'drivingLicenceYear': "16/05/2024",

                'care': care ?? 0, // -- OK
                'id': id ?? 0, // -- OK
                //'images': [],

                //"cni": null,
                //"telephone": null,

                //'personId': personId,
                //'images': images?.map((i) => i?.toJson()).toList(),
                //'nopermis': nopermis,
                //'typepermis': typepermis,
                //'dateCreate': dateCreate,
                //'StatusRequest': StatusRequest,
                //'vgt_id': vgt_id,
                //'originalIndex': originalIndex,
                //'types': types,
              };

            if (personId != null) {
                data['personId'] = personId;
            }

          return data;

  }


  Map<String, dynamic> toJson() {

    Map<String, dynamic> data ={};


    if (personId != null) {
      data['personId'] = personId;
    }

    if (roadType != null) {
      data['roadType'] = roadType?.id;
    }

    if (place != null) {
      data['place'] = place?.id;
    }

    if (range != null) {
      data['range'] = range?.id;
    }

    if (wearingHelmet != null) {
      data['wearingHelmet'] = wearingHelmet?.id;
    }

    if (occupantRestraintSystem != null) {
      data['occupantRestraintSystem'] = occupantRestraintSystem?.id;
    }

    //print("\n\n\n\n\n\n------ Test Type is : ${testStatus?.id} -----\n\n\n\n\n\n");
    if (testStatus != null) {
      data['testStatus'] = testStatus?.id;
    }

    if (testType != null) {
      data['testType'] = testType?.id;
    }

    if (testResult != null) {
      data['testResult'] = testResult?.id;
    }

    if (traumaSeverity != null) {
      data['traumaSeverity'] = traumaSeverity?.id;
    }

    if (alcoholConsumption != null) {
      data['alcoholConsumption'] = alcoholConsumption?.id;
    }

    if(gender != null){
      data['gender'] = gender?.id;
    }

    if(drugUse != null){
      data['drugUse'] = drugUse?.id;
    }

    if(profession != null){
      data['profession'] = profession?.id;
    }

    if(personAction != null){
      data['personAction'] = personAction?.id;
    }

    if(personAccidentNumber != null){
      data['personAccidentNumber'] = personAccidentNumber;
    }

    if(vehicleAccidentNumber != null){
      data['vehicleAccidentNumber'] = vehicleAccidentNumber;
    }

    if(vehicleLinkedPedestrian != null){
      data['vehicleLinkedPedestrian'] = vehicleLinkedPedestrian;
    }

    if(firstName != null && firstName != ""){
      data['firstName'] = firstName;
    }

    if(lastName != null && lastName != ""){
      data['lastName'] = lastName;
    }

    if(birthDate != null || birthDate != ""){
      data['birthDate'] = GlobalMethod.convertirDateFrancais(birthDate);
    }

    if(drivingLicenceYear != null && drivingLicenceYear != ""){
      data['drivingLicenceYear'] = drivingLicenceYear;
    }

    if(care != null || care != 0){
      data['care'] = care ?? 0;
    }

    if(id != null && id != 0){
      data['id'] = id ?? 0;
    }

    if(images != null && images?.length != 0){
      data['images'] = images?.map((i) => i?.toJson()).toList();
    }else{
      data['images'] = [];
    }

    if(nopermis != null && nopermis != ""){
      data['nopermis'] = nopermis;
    }

    if(typepermis != null){
      data['typepermis'] = typepermis;
    }

    /*
    if(dateCreate != null && dateCreate != ""){
      data['dateCreate'] = dateCreate;
    }*/

    if(StatusRequest != null && StatusRequest != ""){
      data['StatusRequest'] = StatusRequest;
    }

    if(vgt_id != null){
      data['vgt_id'] = vgt_id;
    }

    if(originalIndex != null){
      data['originalIndex'] = originalIndex;
    }

    if(types != null && types != ""){
      data['types'] = types;
    }

    print("------ Data Generate is :\n\n\n $data -----\n\n\n");



    return data;

  }

  factory PersonResp.fromString(String data) {
    return PersonResp.fromJson(json.decode(data));
  }


  String toString() {
    return json.encode(this.toJson());
  }

  //------
    PersonResp copyWith({
    int? id,
    String? typePerson,
    String? firstName,
    String? lastName,
    String? cni,
    String? telephone,
    int? personAccidentNumber,
    int? vehicleAccidentNumber,
    int? vehicleLinkedPedestrian,
    String? birthDate,
    GenderResp? gender,
    PersonRoadTypeResp? roadType,
    SeatingRangeResp? range,
    SeatingPlaceResp? place,
    TraumaSeverityResp? traumaSeverity,
    WearingHelmetResp? wearingHelmet,
    OccupantRestraintSystemResp? occupantRestraintSystem,
    ActionResp? personAction,
    AlcoholConsumptionResp? alcoholConsumption,
    AlcoholTestStatusResp? testStatus,
    AlcoholTestTypeResp? testType,
    AlcoholTestResultResp? testResult,
    PersonDrugUseResp? drugUse,
    String? drivingLicenceYear,
    int? care,
    int? personId,
    List<Images>? images,
    ProfessionResp? profession,
    String? nopermis,
    int? typepermis,
    String? dateCreate,
    String? StatusRequest,
    int? vgt_id,
    int? originalIndex,
    String? types,
  }) {
      return PersonResp(

      id: id ?? this.id,
      typePerson: typePerson ?? this.typePerson,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      cni: cni ?? this.cni,
      telephone: telephone ?? this.telephone,
      personAccidentNumber: personAccidentNumber ?? this.personAccidentNumber,
      vehicleAccidentNumber: vehicleAccidentNumber ?? this.vehicleAccidentNumber,
      vehicleLinkedPedestrian: vehicleLinkedPedestrian ?? this.vehicleLinkedPedestrian,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      roadType: roadType ?? this.roadType,
      range: range ?? this.range,
        place: place ?? this.place,
      traumaSeverity: traumaSeverity ?? this.traumaSeverity,
      wearingHelmet: wearingHelmet ?? this.wearingHelmet,
      occupantRestraintSystem:
          occupantRestraintSystem ?? this.occupantRestraintSystem,
      personAction: personAction ?? this.personAction,
      alcoholConsumption: alcoholConsumption ?? this.alcoholConsumption,
      testStatus: testStatus ?? this.testStatus,
      testType: testType ?? this.testType,
      testResult: testResult ?? this.testResult,
      drugUse: drugUse ?? this.drugUse,
      drivingLicenceYear: drivingLicenceYear ?? this.drivingLicenceYear,
      care: care ?? this.care ?? 0,
      personId: personId ?? this.personId ?? 0,
      images: images ?? this.images ?? [],
      profession: profession ?? this.profession,
      nopermis: nopermis ?? this.nopermis,
      typepermis: typepermis ?? this.typepermis,
      dateCreate: dateCreate ?? this.dateCreate,
      StatusRequest: StatusRequest ?? this.StatusRequest,
      vgt_id: vgt_id ?? this.vgt_id,
      originalIndex: originalIndex ?? this.originalIndex,
      types: types ?? this.types,
    );
    }


}



