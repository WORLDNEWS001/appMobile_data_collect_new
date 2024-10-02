//---- create class vehicule resp

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeImageResp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/brand_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/special_function_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_action_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_model_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_type_resp.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';

class VehiculeResp implements AbstratDataSelectDataOms {


      int? id;
      int? vehicleAccidentNumber;
      String? plate;
      String? chassis;
      int? vehicleId;
      VehicleTypeResp? type;
      BrandResp? brand;
      VehicleModelResp? model;
      int? fabricationYear;
      int? cylinderCapacity;
      SpecialFunctionResp? specialFunction;
      VehicleActionResp? vehicleAction;
      List<VehiculeImageResp?>? vehicleImages;


  VehiculeResp({
         this.id,
         this.vehicleAccidentNumber,
         this.plate,
         this.chassis,
         this.vehicleId,
         this.type,
         this.brand,
         this.model,
         this.fabricationYear,
         this.cylinderCapacity,
         this.specialFunction,
         this.vehicleAction,
         this.vehicleImages,
  });


  //------ pour recuperer la valeur Abstraite  de la variable plate
  get value => plate;

  //----------------- les 5 methode comme dans d'autre class ----------------
  
  //-- cerate Methode FromJson
  factory VehiculeResp.fromJson(Map<String, dynamic>? json) {
    return VehiculeResp(
      id: json?['id'],
      vehicleAccidentNumber: json?['vehicleAccidentNumber'],
      plate: json?['plate'],
      chassis: json?['chassis'],
      vehicleId: json?['vehicleId'],
      type: VehicleTypeResp.fromJson(json?['type']),
      brand: BrandResp.fromJson(json?['brand']),
      model: VehicleModelResp.fromJson(json?['model']),
      fabricationYear: json?['fabricationYear'],
      cylinderCapacity: json?['cylinderCapacity'],
      specialFunction: SpecialFunctionResp.fromJson(json?['specialFunction']),
      vehicleAction: VehicleActionResp.fromJson(json?['vehicleAction']),
      vehicleImages: json?['vehicleImages'],
    );
  }


  factory VehiculeResp.fromJsonRequest(Map<String, dynamic>? json, BuildContext context) {

    DataOmsSelectProvider StateProviderData = context.read<DataOmsSelectProvider>();

    return VehiculeResp(
      id: json?['id'],
      vehicleAccidentNumber: json?['vehicleAccidentNumber'],
      plate: json?['plate'],
      chassis: json?['chassis'],
      vehicleId: json?['vehicleId'],
      type: StateProviderData.getVehicleTypeRespById(json?['type'] ),
      brand: StateProviderData.getBrandRespById(json?['brand'] ?? null),
      model: StateProviderData.getVehicleModelRespById(json?['model']),
      fabricationYear: json?['fabricationYear'],
      cylinderCapacity: json?['cylinderCapacity'],
      specialFunction: StateProviderData.getSpecialFunctionRespById(
          json?['specialFunction']),
      vehicleAction:
          StateProviderData.getVehicleActionRespById(json?['vehicleAction']),
      vehicleImages: (json?['vehicleImages'] as List<dynamic>?)
          ?.map((item) => VehiculeImageResp.fromJson(item))
          .toList(),
    );
  }

  //---------------------------- methode copyWith --------------------------
  VehiculeResp copyWith({
    int? id,
    int? vehicleAccidentNumber,
    String? plate,
    String? chassis,
    int? vehicleId,
    VehicleTypeResp? type,
    BrandResp? brand,
    VehicleModelResp? model,
    int? fabricationYear,
    int? cylinderCapacity,
    SpecialFunctionResp? specialFunction,
    VehicleActionResp? vehicleAction,
    List<VehiculeImageResp?>? vehicleImages,
  }) {
    return VehiculeResp(
      id: id ?? this.id ?? 0,
      vehicleAccidentNumber:
          vehicleAccidentNumber ?? this.vehicleAccidentNumber,
      plate: plate ?? this.plate,
      chassis: chassis ?? this.chassis,
      vehicleId: vehicleId ?? this.vehicleId ?? 0,
      type: type ?? this.type,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      fabricationYear: fabricationYear ?? this.fabricationYear,
      cylinderCapacity: cylinderCapacity ?? this.cylinderCapacity,
      specialFunction: specialFunction ?? this.specialFunction,
      vehicleAction: vehicleAction ?? this.vehicleAction,
      vehicleImages: vehicleImages ?? this.vehicleImages,
    );
  }

  //--- methode to json ----
  Map<String, dynamic> toJson_no() => {
        'id': id,
        'vehicleAccidentNumber': vehicleAccidentNumber,
        'plate': plate,
        //'chassis': chassis,
        'vehicleId': vehicleId,
        'type': type?.toJson(),
        'brand': brand?.toJson(),
        'model': model?.toJson(),
        'fabricationYear': fabricationYear,
        'cylinderCapacity': cylinderCapacity,
        'specialFunction': specialFunction?.toJson(),
        'vehicleAction': vehicleAction?.toJson(),
        // 'vehicleImages': vehicleImages?.map((e) => e?.toJson()).toList(),
      };

  //--- methode to json send request ----
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'vehicleAccidentNumber': vehicleAccidentNumber,
      'plate': plate,
      'chassis': chassis,
      'vehicleId': vehicleId,
      'type': type?.id,
      'brand': brand?.id,
      'model': model?.id,
      'fabricationYear': fabricationYear,
      'cylinderCapacity': cylinderCapacity,
      'specialFunction': specialFunction?.id,
      'vehicleAction': vehicleAction?.id,
      //'vehicleImages': [],
    };
    //if (id != null && id != 0) {
    // data['id'] = id;
    //}
    return data;
  }

  /*
      //--- methode to json ----
      Map<String, dynamic> toJson() => {
        'id': id,
        'vehicleAccidentNumber': vehicleAccidentNumber,
        'plate': plate,
       // 'chassis': chassis,
        'vehicleId': vehicleId,
        'type': type?.id,
        'brand': brand,
        'model': model,
        'fabricationYear': fabricationYear,
        'cylinderCapacity': cylinderCapacity,
        'specialFunction': specialFunction,
        'vehicleAction': vehicleAction,
        //'vehicleImages': vehicleImages,
      };
   */

  //--- methode from string
  factory VehiculeResp.fromString(String jsonString) =>
      VehiculeResp.fromJson(json.decode(jsonString));

  //--- methode to string
  String toString() => json.encode(toJson());

  //@override
  //dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

