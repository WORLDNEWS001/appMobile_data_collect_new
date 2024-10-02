
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/View_Dialog/detail_view_dialog/detail_view_dialog_objet.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/CauseResp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/accident_severity_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/accident_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/brightness_condition_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/city_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/climatic_condition_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/impact_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/municipality_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Drawing.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Images.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeResp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/block_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/control_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_category_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_intersection_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_slop_section_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_state_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/virage_resp.dart';
import 'package:secondtest/model/enum/StatusRequest.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';








//----------- create class and methode for vehicules---




class EnquetteData{


   int? id;
   int? idEnquete;
   String? accidentDate;
   String? accidentTime;
   MunicipalityResp? municipality;
   double? latitude;
   double? longitude;
   String? place;
    int? road;
    RoadTypeResp? roadType;
    RoadCategoryResp? roadCategory;
    int? speedLimit;
    BlockResp? block;
    RoadStateResp? roadState;
    RoadIntersectionResp? roadIntersection;
    ControlResp? roadTrafficControl;
    VirageResp? virage;
    RoadSlopSectionResp? roadSlopSection;
    AccidentTypeResp? accidentType;
    ImpactTypeResp? impactType;
    ClimaticConditionResp? climaticCondition;
    BrightnessConditionResp? brightnessCondition;
    AccidentSeverityResp? accidentSeverity;
    CityResp? city;
    String? status;
    StatusRequest? statusRequest;
    DrawingResp? drawing;

    List<VehiculeResp>? vehicules;
    List<PersonResp>? persons;
    List<DirectCauseResp>? causes;
    List<Images>? crashImages;



  EnquetteData({
       this.id,
       this.idEnquete,
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

factory EnquetteData.fromJson(Map<String, dynamic>? json) {
  return EnquetteData(
    id: json?['id'] as int?,
    idEnquete: json?['idEnquete'] as int?,
    accidentDate: json?['accidentDate'] as String?,
    accidentTime: json?['accidentTime'] as String?,
    municipality: MunicipalityResp.fromJson(json?['municipality']),
    latitude: json?['latitude'] as double?,
    longitude: json?['longitude'] as double?,
    place: json?['place'] as String?,
    road: json?['road'] as int?,
    roadType: RoadTypeResp.fromJson(json?['roadType']),
    roadCategory: RoadCategoryResp.fromJson(json?['roadCategory']),
    speedLimit: json?['speedLimit'] as int?,
    block: BlockResp.fromJson(json?['block']),
    roadState: RoadStateResp.fromJson(json?['roadState']),
    roadIntersection: RoadIntersectionResp.fromJson(json?['roadIntersection']),
    roadTrafficControl: ControlResp.fromJson(json?['roadTrafficControl']),
    virage: VirageResp.fromJson(json?['virage']),
    roadSlopSection: RoadSlopSectionResp.fromJson(json?['roadSlopSection']),
    accidentType: AccidentTypeResp.fromJson(json?['accidentType']),
    impactType: ImpactTypeResp.fromJson(json?['impactType']),
    climaticCondition: ClimaticConditionResp.fromJson(json?['climaticCondition']),
    brightnessCondition: BrightnessConditionResp.fromJson(json?['brightnessCondition']),
    accidentSeverity: AccidentSeverityResp.fromJson(json?['accidentSeverity']),
    city: CityResp.fromJson(json?['city']),
    status: json?['status'] as String?,
    statusRequest: statusRequestFromString(json?['statusRequest']),
    vehicules: (json?['vehicules'] as List<dynamic>?)?.map((item) => VehiculeResp.fromJson(item)).toList(),
    persons: (json?['persons'] as List<dynamic>?)?.map((item) => PersonResp.fromJson(item)).toList(),
    causes: (json?['causes'] as List<dynamic>?)?.map((item) => DirectCauseResp.fromJson(item)).toList(),
    crashImages: (json?['crashImages'] as List<dynamic>?)?.map((item) => Images.fromJson(item)).toList(),
    drawing: DrawingResp.fromJson(json?['drawing']),
  );
}


   factory EnquetteData.fromJsonRequest(Map<String, dynamic>? json, BuildContext context) {

       DataOmsSelectProvider StateProviderData = context.read<DataOmsSelectProvider>();

       //List<MunicipalityResp?>? dataView = StateProviderData.municipalityRespListSelect;
       //print("\n\n\n\n\n data view de minicupality est :::\n \n\n la liste est $dataView \n\n\n\n\n");

       //---------------------------------------------

       //List<RoadSlopSectionResp?>? dataViewdataViewRoad = StateProviderData.roadSlopSectionRespListSelect;
       //print("\n\n\n\n\n data view de dataViewRoad est :::\n \n\n la liste est $dataViewdataViewRoad \n\n\n\n\n");

       //Logger().e("\n \n\n--------- data Statut json?['status']  ----- ${json?['status'] }    -\n \n\n ");


       //DataOmsSelectProvider dataOmsSelectProvider=  context.read<DataOmsSelectProvider>();
       //List<ControlResp> listControlResp = dataOmsSelectProvider.controlRespListSelect;
       //Logger().e("\n\n\n\n+++++++++++ Afficher les données de  listControlResp recuperer::\n\n Get data by code :: ${dataOmsSelectProvider.getControlRespById(0)} -------- \n\n ${listControlResp}  +++++++++\n\n\n\n");

       return EnquetteData(
         id: json?['id'] as int?,
         idEnquete: json?['idEnquete'] as int?,

         accidentDate: json?['accidentDate'] as String?,
         accidentTime: json?['accidentTime'] as String?,
         municipality: context.read<DataOmsSelectProvider>().getMunicipalityRespById(json?['municipality']),
         latitude: json?['latitude'] as double?,
         longitude: json?['longitude'] as double?,
         place: json?['place'] as String?,
         road: json?['road'] as int?,
         roadType: StateProviderData.getRoadTypeRespById(json?['roadType']),
         roadCategory: StateProviderData.getRoadCategoryRespById(json?['roadCategory']),
         speedLimit: json?['speedLimit'] as int?,
         block: StateProviderData.getBlockRespById(json?['block']),
         roadState: StateProviderData.getRoadStateRespById(json?['roadState']),
         roadIntersection: StateProviderData.getRoadIntersectionRespById(json?['roadIntersection']),
         roadTrafficControl: StateProviderData.getControlRespById(json?['roadTrafficControl']),
         virage: StateProviderData.getVirageRespById(json?['virage']),

         roadSlopSection: StateProviderData.getRoadSlopSectionRespById(json?['roadSlopSection']),
         accidentType: StateProviderData.getAccidentTypeRespById(json?['accidentType']),
         impactType: StateProviderData.getImpactTypeRespById(json?['impactType']),
         climaticCondition: StateProviderData.getClimaticConditionRespById(json?['climaticCondition']),
         brightnessCondition: StateProviderData.getBrightnessConditionRespById(json?['brightnessCondition']),
         accidentSeverity: StateProviderData.getAccidentSeverityRespById(json?['accidentSeverity']),
         city: StateProviderData.getCityRespById(json?['city']),
         status: json?['status'] as String?,
         statusRequest: statusRequestFromString(json?['statusRequest']),
         vehicules: (json?['vehicules'] as List<dynamic>?)?.map((item) => VehiculeResp.fromJsonRequest(item,context)).toList(),
         persons: (json?['persons'] as List<dynamic>?)?.map((item) => PersonResp.fromJsonRequest(item,context)).toList(),
         causes: (json?['causes'] as List<dynamic>?)?.map((item) => DirectCauseResp.fromJson(item)).toList(),
         crashImages: (json?['crashImages'] as List<dynamic>?)?.map((item) => Images.fromJson(item)).toList(),
         drawing: DrawingResp.fromJson(json?['drawing']),
       );
   }






    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'idEnquete': idEnquete,

        'accidentDate': accidentDate,
        'accidentTime': accidentTime,
        'municipality': municipality?.toJson(),
        'latitude': latitude,
        'longitude': longitude,
        'place': place,
        'road': road,
        'roadType': roadType?.toJson(),
        'roadCategory': roadCategory?.toJson(),
        'speedLimit': speedLimit,
        'block': block?.toJson(),
        'roadState': roadState?.toJson(),
        'roadIntersection': roadIntersection?.toJson(),
        'roadTrafficControl': roadTrafficControl?.toJson(),
        'virage': virage?.toJson(),
        'roadSlopSection': roadSlopSection?.toJson(),
        'accidentType': accidentType?.toJson(),
        'impactType': impactType?.toJson(),
        'climaticCondition': climaticCondition?.toJson(),
        'brightnessCondition': brightnessCondition?.toJson(),
        'accidentSeverity': accidentSeverity?.toJson(),
        'city': city?.toJson(),
        'status': status,
        'statusRequest': statusRequest?.toString(),
        'vehicules': vehicules?.map((v) => v.toJson()).toList(),
        'persons': persons?.map((p) => p.toJson()).toList(),
        'causes': causes?.map((c) => c.toJson()).toList(),
        'crashImages': crashImages?.map((i) => i.toJson()).toList(),
        'drawing': drawing?.toJson(),
      };
    }



   Map<String, dynamic> toJson_send_to_add_EnquetteRequest() {





     Map<String, dynamic> data = {
       "latitude": latitude,
       "longitude": longitude,
       "causes": causes?.map((c) => c.toJson()).toList(),
       "accidentType": accidentType?.id ?? 1,
       "impactType": impactType?.id ?? 1,
       "climaticCondition": climaticCondition?.id ?? 1,
       "brightnessCondition": brightnessCondition?.id ?? 1,
       "roadType": roadType?.id ?? 1,
       "roadState": roadState?.id ?? 1,
       "roadIntersection": roadIntersection?.id ?? 1,
       "block": block?.id ?? 1,
       "roadTrafficControl":roadTrafficControl?.id ?? 1,
       "virage": virage?.id ?? 1,
       "roadSlopSection": roadSlopSection?.id ?? 1,
       "accidentSeverity": accidentSeverity?.id ?? 1,
       "accidentDate":GlobalMethod.convertirDateFrancais(accidentDate),
       "city": city?.id ?? 1,
       "municipality": municipality?.id ?? 1 ,
       "place": place ??"",
       "roadCategory": roadCategory?.id ?? 1,
       "accidentTime": accidentTime ?? "11:14",
       "road": 0,
       "status": "OPENED",
       "speedLimit": speedLimit ?? 0,
       "vehicules":  vehicules?.map((v) => v.toJson()).toList() ?? [],
       "persons": persons?.map((p) => p.toJson()).toList() ?? [],
       "crashImages": crashImages?.map((i) => i.toJson()).toList() ?? [],
       //"crashImages": [],
       "drawing": drawing?.toJson() ?? {},
       "id": 0
     };


     return data;
   }

/*
   "persons": [
   {
   "id": 531,
   "firstName": "JOEL1 TEST",
   "lastName": "JOEL PRENOM 1 TEST",
   "cni": null,
   "telephone": null,
   "personAccidentNumber": 1,
   "vehicleAccidentNumber": 1,
   "vehicleLinkedPedestrian": 1,
   "birthDate": "14/05/2024",
   "gender": 2,
   "roadType": 2,
   "range": 3,
   "place": 3,
   "traumaSeverity": 3,
   "wearingHelmet": 2,
   "occupantRestraintSystem": 5,
   "personAction": 3,
   "alcoholConsumption": 2,
   "testStatus": 1,
   "testType": 1,
   "testResult": 1,
   "drugUse": 3,
   "drivingLicenceYear": "16/05/2024",
   "care": 0,
   "personId": 739,
   "images": [],
   "profession": 1
   }
   ],

 */

   Map<String, dynamic> toJson_send_to_edit_EnquetteRequest() {
     return {
       //"accidentReq": {
       "persons": persons?.map((p) => p.toJson()).toList() ?? [],
       //"persons": [],
       //"persons": (persons?.map((p) => p.toJson()).toList())?.length != 0 ? [] : persons?.map((p) => p.toJson()).toList() ?? [],


       // "persons": [
       //   {
       //     "id": 531,
       //     "firstName": "JOEL1 TEST",
       //     "lastName": "JOEL PRENOM 1 TEST",
       //     "personAccidentNumber": 1,
       //     "vehicleAccidentNumber": 1,
       //     "vehicleLinkedPedestrian": 1,
       //     "birthDate": "14/05/2024",
       //     "gender": 2,
       //     "roadType": 2,
       //     "range": 3,
       //     "place": 3,
       //     "traumaSeverity": 3,
       //     "wearingHelmet": 2,
       //     "occupantRestraintSystem": 5,
       //     "personAction": 3,
       //     "alcoholConsumption": 2,
       //     "testStatus": 1,
       //     "testType": 1,
       //     "testResult": 1,
       //     "drugUse": 3,
       //     "drivingLicenceYear": "16/05/2024",
       //     "care": 0,
       //     "personId": 0,
       //     "images": [],
       //     "profession": 1
       //   },
       //   {
       //     "personId": 778,
       //     "roadType": 3,
       //     "place": 3,
       //     "range": 3,
       //     "wearingHelmet": 2,
       //     "occupantRestraintSystem": 7,
       //     "testType": 1,
       //     "testResult": 1,
       //
       //     "testStatus": 1,
       //
       //     "traumaSeverity": 2,
       //     "alcoholConsumption": 2,
       //     "gender": 2,
       //     "drugUse": 2,
       //     "profession": 7,
       //     "personAction": 4,
       //     "personAccidentNumber": 3,
       //     "vehicleAccidentNumber": 1,
       //     "vehicleLinkedPedestrian": 1,
       //     "firstName": "tyyui",
       //     "lastName": "jojo",
       //     "birthDate": "11/06/2024",
       //     "drivingLicenceYear": "16/05/2024",
       //     "care": 0,
       //     "id": 570,
       //     "images": [],
       //
       //
       //   }
       // ],

       "id": id ?? 0,
       "latitude": latitude,
       "longitude": longitude,
       "causes": causes?.map((c) => c.toJson()).toList(),
       "accidentType": accidentType?.id ?? 1,
       "impactType": impactType?.id ?? 1,
       "climaticCondition": climaticCondition?.id ?? 1,
       "brightnessCondition": brightnessCondition?.id ?? 1,
       "roadType": roadType?.id ?? 1,
       "roadState": roadState?.id ?? 1,
       "roadIntersection": roadIntersection?.id ?? 1,
       "block": block?.id ?? 1,
       "roadTrafficControl":roadTrafficControl?.id ?? 1,
       "virage": virage?.id ?? 1,
       "roadSlopSection": roadSlopSection?.id ?? 1,
       "accidentSeverity": accidentSeverity?.id ?? 1,
       "accidentDate":GlobalMethod.convertirDateFrancais(accidentDate),
       "city": city?.id ?? 1,
       "municipality": municipality?.id ?? 1 ,
       //"place": "MOB : ${place}",
       "place": place ?? "",
       "roadCategory": roadCategory?.id ?? 1,
       "accidentTime": accidentTime ?? "11:14",
       "road": 0,
       "status": "OPENED",
       "speedLimit": speedLimit ?? 0,
       "vehicules":  vehicules?.map((v) => v.toJson()).toList() ?? [],
       "crashImages": crashImages?.map((i) => i.toJson()).toList() ?? [],
       //"crashImages": [],

       /*
       "crashImages": [
         {
           "path": "http://51.195.11.202:8099/public/images/accident/crash/CRASH20240610152546970.png",
           "name": "CRASH20240610152546970.png"
         },
       ],
        */

       "drawing": drawing?.toJson() ?? {},

       //}
     };
   }





factory EnquetteData.fromString(String jsonString) {
  return EnquetteData.fromJson(json.decode(jsonString));
}


String toString() {
  return json.encode(this.toJson());
}



EnquetteData copyWith({
  int? id,
  int? idEnquete,

  String? accidentDate,
  String? accidentTime,
  MunicipalityResp? municipality,
  double? latitude,
  double? longitude,
  String? place,
  int? road,
  RoadTypeResp? roadType,
  RoadCategoryResp? roadCategory,
  int? speedLimit,
  BlockResp? block,
  RoadStateResp? roadState,
  RoadIntersectionResp? roadIntersection,
  ControlResp? roadTrafficControl,
  VirageResp? virage,
  RoadSlopSectionResp? roadSlopSection,
  AccidentTypeResp? accidentType,
  ImpactTypeResp? impactType,
  ClimaticConditionResp? climaticCondition,
  BrightnessConditionResp? brightnessCondition,
  AccidentSeverityResp? accidentSeverity,
  CityResp? city,
  String? status,
  StatusRequest? statusRequest,
  DrawingResp? drawing,
  List<VehiculeResp>? vehicules,
  List<PersonResp>? persons,
  List<DirectCauseResp>? causes,
  List<Images>? crashImages,
}) {
  return EnquetteData(
    id: id ?? this.id,
    idEnquete: idEnquete ?? this.idEnquete,

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
    city: city ?? this.city,
    status: status ?? this.status,
    statusRequest: statusRequest ?? this.statusRequest,
    drawing: drawing ?? this.drawing,
    vehicules: vehicules ?? this.vehicules,
    persons: persons ?? this.persons,
    causes: causes ?? this.causes,
    crashImages: crashImages ?? this.crashImages,
  );
}


   static List<EnquetteData> fromList(List<Map<String, dynamic>> list) {
     return list.map((item) => EnquetteData.fromJson(item)).toList();
   }






   //-------------------Methode Add image Accident-------------------









   //-------------------Methode d'Execution de requette de creation d'une enquette -------------------

    Future<Map<String, dynamic>?> executeRequestCreateEnquete({required BuildContext context}) async {
      try {
        Logger().i("\n\n /-----------(Requette : (Create Enquete))---Start Section Class Request API !!  with data : ${toJson_send_to_add_EnquetteRequest()} ------------------\n\n");

        //-------------Execution de la requete de creation d'une enquette
        Map<String, dynamic>? resultRequest = await CreateEnqueteRequestDio(json_data_send: toJson_send_to_add_EnquetteRequest());

        Logger().e("\n\n /-----------(Requette : (Create Enquete))---Result Section Class Request API !!  with data : ${resultRequest} ------------------\n\n");


        //----- waiting 2 milliseconds
        await Future.delayed(Duration(milliseconds: 2));
        //------- return result*
        return resultRequest;
        //return {};
      } catch (e) {
        Logger().e(
            "/-----------(Requette : (Create Enquete))---Error Section Class Request API ------------------");
        return {"error": e.toString()};
      }
    }



    //--------------- methode de la requette modification d'une enquette

   Future<Map<String, dynamic>?> executeRequestEditEnquete({required BuildContext context}) async {
     try {
       Logger().i("\n\n /-----------(Requette : (Edit Enquete))---Start Section Class Request API !!  with data : ${toJson_send_to_add_EnquetteRequest()} ------------------\n\n");

       //-------------Execution de la requete de creation d'une enquette
       Map<String, dynamic>? resultRequest = await EditEnqueteRequestDio(json_data_send: toJson_send_to_edit_EnquetteRequest());


       //----- waiting 2 milliseconds
       await Future.delayed(Duration(milliseconds: 2));
       //------- return result*
       return resultRequest;
       //return {};
     } catch (e) {
       Logger().e("/-----------(Requette : (Edit Enquete))---Error Section Class Request API ------------------");
       return {"error": e.toString()};
     }
   }








  //------- Methode to Add vehicule in EnquetteData
    void addVehicule(VehiculeResp vehicule) {
      vehicules?.add(vehicule);
    }





  functionToAlertSuccess(BuildContext context) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'success',
      heightFactor: 0.33,
      title: "Success",
      subTitle: "Confirmation Success",
      confirmAction: () async {

        print("print confirm create enquette");

      },
      exitAction: () {
        print("Annuler");
      },
      content:Container(
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Enquette Déclaré avec Success",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ).show(context);

  }



  functionToAlertEditSuccess(BuildContext context) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'success',
      heightFactor: 0.33,
      title: "Success",
      subTitle: "Confirmation Success",
      confirmAction: () async {

        print("print confirm Edit enquette");

      },
      exitAction: () {
        print("Annuler");
      },
      content:Container(
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Modification de l'enquette effectuée avec Success",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ).show(context);

  }


  functionToAlertError(BuildContext context) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'danger',
      heightFactor: 0.33,
      title: "Echec",
      subTitle: "Execution de la requette echouer",
      confirmAction: () async {

        print("echec de Declaration de l'enquette ");

      },
      exitAction: () {
        print("Annuler");
      },
      content:Container(
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Echec de déclaration de la requette",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ).show(context);

  }






}





