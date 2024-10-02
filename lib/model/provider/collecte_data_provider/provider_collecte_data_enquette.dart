import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/CauseResp.dart';

import 'package:secondtest/model/class_data_oms_type/Accident/accident_severity_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/accident_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/brightness_condition_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/city_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/climatic_condition_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/impact_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/municipality_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Drawing.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeResp.dart';
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
import 'package:secondtest/model/class_data_oms_type/Route/block_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/control_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_category_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_intersection_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_slop_section_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_state_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/road_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Route/virage_resp.dart';

import 'package:secondtest/model/class_data_oms_type/Vehicule/brand_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/special_function_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_action_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_model_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Vehicule/vehicle_type_resp.dart';
import 'package:secondtest/model/other_class_object/GeoPosition.dart';
import 'package:secondtest/services/manage_image/pick_image_data.dart';


class ProviderColleteDataEnquete with ChangeNotifier {


  Map<String, dynamic>? data_new_enquette;
  EnquetteData? DataFormEnquete = EnquetteData();


  //-------------- Manage drawing croquis --------------//
  DrawingResp? data_enq_drawingCroquis;

  //----------- Methode recuperer les donnees collecter qui permet de mettre à jour les données de l'enquete ------------//-
  UpdateDataFormEnquete() {

    notifyListeners();

    //-----------------------------/////--- info Road Enquete ---//////-----------------------------//
    DataFormEnquete?.latitude = data_enq_accident_position?.lat;
    DataFormEnquete?.longitude = data_enq_accident_position?.lon;

    //------------ IMAGE CRASH---------
    DataFormEnquete?.crashImages = data_enq_ProviderPickImageDataCrashLocal?.listImagesSend;
    //--------------------------------------------------------
    //print("\n\n\n  ---- Data -- DataFormEnquete?.crashImages  is ::: ${DataFormEnquete?.crashImages}  \n\n\n\n");
    DataFormEnquete?.speedLimit = data_enq_limite_vitesse;
    DataFormEnquete?.roadType = data_enq_road_type;
    DataFormEnquete?.roadState = data_enq_road_state;
    DataFormEnquete?.roadSlopSection = data_enq_slop_section;
    DataFormEnquete?.roadTrafficControl = data_enq_control;
    DataFormEnquete?.roadCategory = data_enq_road_category;
    DataFormEnquete?.block = data_enq_block;
    DataFormEnquete?.roadIntersection = data_enq_road_intersection;
    DataFormEnquete?.virage = data_enq_virage;


    //-----------------------------/////--- info Accident Enquete ---//////-----------------------------//
    DataFormEnquete?.causes = data_enq_direct_cause; //new
    DataFormEnquete?.accidentDate = date_accident_controller?.text;
    DataFormEnquete?.accidentTime = time_accident_controller?.text;
    DataFormEnquete?.place = places_accident_controller?.text;
    DataFormEnquete?.city = data_enq_city;
    DataFormEnquete?.municipality = data_enq_municipality;
    DataFormEnquete?.accidentType = data_enq_accident_type;
    DataFormEnquete?.climaticCondition = data_enq_climatic_condition;
    DataFormEnquete?.impactType = data_enq_impact_type;
    DataFormEnquete?.brightnessCondition = data_enq_brightness_condition;
    DataFormEnquete?.accidentSeverity = data_enq_accident_severity;

    //---------------------// Vehicule Enquete //----------------------------//
    DataFormEnquete?.vehicules = list_data_enq_vehicules;

    //---------------------// Person Enquete //----------------------------//
    DataFormEnquete?.persons = list_data_enq_persons;

    //---------------------// Drawing croquis Enquete //----------------------------//
    DataFormEnquete?.drawing = data_enq_drawingCroquis;

    //Logger().e("\n\n\n  ---- Data -- Place is ::: ${DataFormEnquete?.place}  \n  --- Data -- de base places_accident_controller?.text : :: ${places_accident_controller?.text}  \n\n\n");

    notifyListeners();
  }

  //----------- Methode qui permet d'ouvrir le fomulaire de l'enquete en Mode Edition ------------//-
  UpdateProvidersCollecteByDataEnquete(EnquetteData enquetteData) {
    DataFormEnquete = enquetteData;

    data_enq_accident_position?.lat = DataFormEnquete?.latitude;
    data_enq_accident_position?.lon = DataFormEnquete?.longitude;
    data_enq_controller_locator?.text = "Lat : ${DataFormEnquete?.latitude} - Long : ${DataFormEnquete?.longitude}";
    GeoPosition? data_enq_receive_locator = GeoPosition(
      lat: DataFormEnquete?.latitude,
      lon: DataFormEnquete?.longitude,
    );
    Update_data_enq_accident_position(data_enq_receive: data_enq_receive_locator);

    //------------ IMAGE CRASH---------
    data_enq_ProviderPickImageDataCrashLocal?.setListImagesSend(DataFormEnquete?.crashImages);
    //--------------------------------------------------------

    //------------- Collect Road Data -----------------//
    data_enq_limite_vitesse = DataFormEnquete?.speedLimit;
    data_enq_road_type = DataFormEnquete?.roadType;
    data_enq_road_state = DataFormEnquete?.roadState;
    data_enq_slop_section = DataFormEnquete?.roadSlopSection;
    data_enq_control = DataFormEnquete?.roadTrafficControl;
    data_enq_road_category = DataFormEnquete?.roadCategory;
    data_enq_block = DataFormEnquete?.block;
    data_enq_road_intersection = DataFormEnquete?.roadIntersection;
    data_enq_virage = DataFormEnquete?.virage;

    //------------- Collect Accident Data -----------------//
    date_accident_controller?.text = DataFormEnquete?.accidentDate ?? "";
    time_accident_controller?.text = DataFormEnquete?.accidentTime ?? "";
    places_accident_controller?.text = DataFormEnquete?.place ?? "";
    data_enq_city = DataFormEnquete?.city;
    data_enq_municipality = DataFormEnquete?.municipality;
    data_enq_accident_type = DataFormEnquete?.accidentType;
    data_enq_climatic_condition = DataFormEnquete?.climaticCondition;
    data_enq_impact_type = DataFormEnquete?.impactType;
    data_enq_brightness_condition = DataFormEnquete?.brightnessCondition;
    data_enq_accident_severity = DataFormEnquete?.accidentSeverity;

    //---------------------// Vehicule Enquete //----------------------------//
    list_data_enq_vehicules = DataFormEnquete?.vehicules;

    //---------------------// Person Enquete //----------------------------//
    list_data_enq_persons = DataFormEnquete?.persons;

    //---------------------// Drawing croquis Enquete //----------------------------//
    data_enq_drawingCroquis = DataFormEnquete?.drawing;


    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  //----------------------- Collect data Road -----------------//
  //----------------------- Collect data Road -----------------//
  TextEditingController? controller_limite_vitesse = TextEditingController();
  TextEditingController? data_enq_controller_locator = TextEditingController();
  int? data_enq_limite_vitesse;
  RoadTypeResp? data_enq_road_type;
  RoadStateResp? data_enq_road_state;
  RoadSlopSectionResp? data_enq_slop_section;
  ControlResp? data_enq_control;
  RoadCategoryResp? data_enq_road_category;
  BlockResp? data_enq_block;
  RoadIntersectionResp? data_enq_road_intersection;
  VirageResp? data_enq_virage;
  //--------------- Localisation data Accident -----------------//
  GeoPosition? data_enq_accident_position;
  Update_data_enq_accident_position({required GeoPosition? data_enq_receive}) {
    data_enq_accident_position = data_enq_receive;
    data_enq_controller_locator?.text = "${'${data_enq_receive?.city ?? ""}'} ${'- ${data_enq_receive?.street ?? ""}'} ${'- Lat : ${data_enq_receive?.lat ?? ""}'} - Long : ${data_enq_receive?.lon ?? ""}";
    DataFormEnquete?.longitude = data_enq_receive?.lon;
    DataFormEnquete?.latitude = data_enq_receive?.lat;
    notifyListeners();
  }




  //---------- Collect info Accident Data Accident -----------------------//
  //---------- Collect info Accident Data Accident -----------------------//
  //---- PICK IMAGE CRASH LOCAL --//
  late PickImageData? data_enq_ProviderPickImageDataCrashLocal =
      PickImageData();
  List<DirectCauseResp>? data_enq_direct_cause;
  CityResp? data_enq_city;
  MunicipalityResp? data_enq_municipality;
  AccidentTypeResp? data_enq_accident_type;
  ClimaticConditionResp? data_enq_climatic_condition;
  ImpactTypeResp? data_enq_impact_type;
  BrightnessConditionResp? data_enq_brightness_condition;
  AccidentSeverityResp? data_enq_accident_severity;
  TextEditingController? date_accident_controller = TextEditingController();
  TextEditingController? time_accident_controller = TextEditingController();
  TextEditingController? places_accident_controller = TextEditingController();

  //----- Methode d'ajout de cause dans la liste des causes de l'accident, executer apres un chois dans le formulaire de selection de cause
  AddCauseToList({required DirectCauseResp? cause}) {
    if (data_enq_direct_cause == null) {
      //data_enq_direct_cause = [];
    }
    data_enq_direct_cause?.add(cause!);
    notifyListeners();
  }







  //-------####---------------- Collect data Car Crash -----------------//
  //-------####---------------- Collect data Car Crash -----------------//
  VehiculeResp? data_enq_oneVehiculeCrash = VehiculeResp();
  bool isUpdateVehicule = false;

  //---- PICK IMAGE CAR CRASH LOCAL --//
  late PickImageData? data_enq_ProviderPickImageVehiculeCrash = PickImageData();
  List<VehiculeResp>? list_data_enq_vehicules = [];
  TextEditingController? data_enq_num_vehicule_controller = TextEditingController();
  TextEditingController? data_enq_num_immatriculation = TextEditingController();
  TextEditingController? data_enq_num_chassis = TextEditingController();
  TextEditingController? data_enq_year_model_vehicule = TextEditingController();
  TextEditingController? data_enq_nbr_cylindre = TextEditingController();
  BrandResp? data_enq_brand;
  VehicleTypeResp? data_enq_vehicle_type;
  VehicleModelResp? data_enq_vehicleModel;
  SpecialFunctionResp? data_enq_specialFunction;
  VehicleActionResp? data_enq_vehicleActionRespListSelect;
  late int? data_enq_vehicleAccidentNumber_vehicule = 0;

  //-----------Methode qui permet la recharge des donnee d'un vehicule selectionner dans le formulaire ------------//
  UpdateFormOneVehiculeSelect({required VehiculeResp? oneVehiculeCrash}) {
    data_enq_oneVehiculeCrash = oneVehiculeCrash;
    data_enq_vehicleAccidentNumber_vehicule =
        oneVehiculeCrash?.vehicleAccidentNumber;
    data_enq_num_vehicule_controller?.text =
        oneVehiculeCrash?.vehicleAccidentNumber.toString() ?? "";
    data_enq_num_immatriculation?.text = oneVehiculeCrash?.plate ?? "";
    data_enq_num_chassis?.text = oneVehiculeCrash?.chassis ?? "";
    data_enq_vehicle_type = oneVehiculeCrash?.type;
    data_enq_brand = oneVehiculeCrash?.brand;
    data_enq_vehicleModel = oneVehiculeCrash?.model;
    data_enq_year_model_vehicule?.text =
        oneVehiculeCrash?.fabricationYear.toString() ?? "";
    data_enq_nbr_cylindre?.text =
        oneVehiculeCrash?.cylinderCapacity.toString() ?? "";
    data_enq_specialFunction = oneVehiculeCrash?.specialFunction;
    data_enq_vehicleActionRespListSelect = oneVehiculeCrash?.vehicleAction;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  //------------ methode Generate one Vehicule pour Action enregistrer ou modifier --------------//
  Update_list_data_enq_vehicules() {
    if (isUpdateVehicule == false) {
      //---- si nous somme en mode Ajout
      data_enq_vehicleAccidentNumber_vehicule = list_data_enq_vehicules!.length;



      Logger().e("data_enq_vehicleAccidentNumber_vehicule ici apres comptage de la liste  :: $data_enq_vehicleAccidentNumber_vehicule \n");

      data_enq_vehicleAccidentNumber_vehicule = data_enq_vehicleAccidentNumber_vehicule! + 1;

      //----------- verifier si dans la liste des vehicule il ya un vehicule qui a un vehicleAccidentNumber = data_enq_vehicleAccidentNumber_vehicule si oui on incremente de 1 et verifier a nouveau jusqua ce que le vehicleAccidentNumber n'existe pas dans la liste
      while (list_data_enq_vehicules!.any((element) => element.vehicleAccidentNumber == data_enq_vehicleAccidentNumber_vehicule)) {
        data_enq_vehicleAccidentNumber_vehicule = data_enq_vehicleAccidentNumber_vehicule! + 1;
      }

      Logger().e("data_enq_vehicleAccidentNumber_vehicule ici apres comptage de la liste  :: $data_enq_vehicleAccidentNumber_vehicule \n");

    } else {
      //---- si nous somme en mode Modification
      Logger().e("data_enq_vehicleAccidentNumber_vehicule NOUS SOMME EN MODE EDIT  :: $data_enq_vehicleAccidentNumber_vehicule \n");

    }

    VehiculeResp? vehiculeResp = data_enq_oneVehiculeCrash?.copyWith(
      vehicleAccidentNumber: data_enq_vehicleAccidentNumber_vehicule,
      plate: data_enq_num_immatriculation?.text,
      chassis: data_enq_num_chassis?.text,
      type: data_enq_vehicle_type,
      brand: data_enq_brand,
      model: data_enq_vehicleModel,
      fabricationYear: int.tryParse((data_enq_year_model_vehicule?.text) ?? ""),
      cylinderCapacity: int.tryParse((data_enq_nbr_cylindre?.text) ?? ""),
      specialFunction: data_enq_specialFunction,
      vehicleAction: data_enq_vehicleActionRespListSelect,
      vehicleImages: [],
    );
    print(
        "\n\n vehicleAccidentNumber :: $data_enq_vehicleAccidentNumber_vehicule \n");
    print(
        " data_enq_num_immatriculation :: ${data_enq_num_immatriculation?.text} \n");
    print(" chassis :: ${data_enq_num_chassis?.text} \n");
    print(" type :: ${data_enq_vehicle_type} \n");
    print(" brand :: ${data_enq_brand} \n");
    print(" model :: ${data_enq_vehicleModel} \n");
    print(" fabricationYear :: ${data_enq_year_model_vehicule?.text} \n");
    print(" cylinderCapacity :: ${data_enq_nbr_cylindre?.text} \n");
    print(" specialFunction :: ${data_enq_specialFunction} \n");
    print(" vehicleAction :: ${data_enq_vehicleActionRespListSelect} \n");
    //print("\n\n Les donnee collecter sont  \n ${data_enq_oneVehiculeCrash} \n\n");
    print(
        "\n\n Dans le Update_list_data_enq_vehicules j'ajoute ce vehucule dans la liste des vehicules Ceci \n ${vehiculeResp} \n\n");

    if (vehiculeResp != null) {
      if (isUpdateVehicule == false) {
        print(
            "\n\n pendant la creation normal Dans le Update_list_data_enq_vehicules j'ajoute ce vehucule dans la liste des vehicules Ceci \n ${vehiculeResp} \n\n");
        list_data_enq_vehicules?.add(vehiculeResp);
      } else {
        list_data_enq_vehicules?.removeWhere((element) =>
            element.vehicleAccidentNumber ==
            vehiculeResp.vehicleAccidentNumber);
        list_data_enq_vehicules?.add(vehiculeResp);
      }
    }

    notifyListeners();
  }


  //--------- une methode qui permet de supprimer un vehicule de la liste des vehicules
  DeleteVehicule({required VehiculeResp? vehiculeResp}) {
    list_data_enq_vehicules?.removeWhere((element) =>
    element.vehicleAccidentNumber == vehiculeResp?.vehicleAccidentNumber);
    notifyListeners();
  }








  //-------#####-------- Method Record Form Person Crash Data- ----------------//
  //-------#####-------- Method Record Form Person Crash Data- ----------------//
  PersonResp? data_enq_onePersonCrash = PersonResp();
  bool isUpdatePerson = false;

  //---- PICK IMAGE PERSON CRASH LOCAL --//
  late PickImageData? data_enq_ProviderPickImagePersonCrash = PickImageData();
  String? TypePerson;

  List<PersonResp>? list_data_enq_persons = [];
  TextEditingController? data_enq_firstName = TextEditingController();
  TextEditingController? data_enq_lastName = TextEditingController();
  TextEditingController? data_enq_cni = TextEditingController();
  TextEditingController? data_enq_telephone = TextEditingController();
  late VehiculeResp? data_enq_vehiculeChoise;
  TextEditingController? data_enq_num_vehicleChoise = TextEditingController();
  //late int? data_enq_personAccidentNumber = int.tryParse(data_enq_personAccidentNumber_controller?.text);
  TextEditingController? data_enq_personAccidentNumber_controller = TextEditingController();
  late int? data_enq_vehicleAccidentNumber_person = data_enq_vehiculeChoise?.vehicleAccidentNumber;
  late int? data_enq_vehicleLinkedPedestrian = data_enq_vehiculeChoise?.vehicleAccidentNumber;
  TextEditingController? data_enq_birthDate = TextEditingController();
  GenderResp? data_enq_gender;
  PersonRoadTypeResp? data_enq_personRoadType;
  SeatingRangeResp? data_enq_range;
  SeatingPlaceResp? data_enq_place;
  TraumaSeverityResp? data_enq_traumaSeverity;
  WearingHelmetResp? data_enq_wearingHelmet;
  OccupantRestraintSystemResp? data_enq_occupantRestraintSystem;
  ActionResp? data_enq_personAction;
  AlcoholConsumptionResp? data_enq_alcoholConsumption;
  AlcoholTestStatusResp? data_enq_testStatus;
  AlcoholTestTypeResp? data_enq_testType;
  AlcoholTestResultResp? data_enq_testResult;
  PersonDrugUseResp? data_enq_drugUse;
  TextEditingController? data_enq_drivingLicenceYear = TextEditingController();
  int? data_enq_care = 0;
  int? data_enq_personId = 0;
  ProfessionResp? data_enq_Profession;
  TextEditingController? data_enq_nopermis = TextEditingController();
  String? data_enq_personDateCreate = DateTime.now().toString();
  int? data_enq_data_enq_vgt_id;
  int? data_enq_originalIndex;
  String? data_enq_types;

/*
  1--////////-- Chauffeur -- /////----
  1++(Chauffeur)  "nopermis": "9988",
  1++(Chauffeur)  "typepermis": 1,
  1++(Chauffeur)  "drivingLicenceYear": "23/05/2022",
*/

  //------------ methode Generate one Person pour action d'enregistrement ou de mise a jour--------------//
  Update_list_Person() {
    int? data_enq_personAccidentNumber;
    data_enq_personAccidentNumber = data_enq_personAccidentNumber_controller?.text != null ? int.tryParse(data_enq_personAccidentNumber_controller?.text ??"") ?? 0 : 0;
    if (isUpdatePerson == false) {
      //---- si nous somme en mode Ajout
     // data_enq_personAccidentNumber = list_data_enq_persons!.length;
      Logger().e("data_enq_personAccidentNumber ici apres comptage de la liste  :: $data_enq_personAccidentNumber \n");
     // data_enq_personAccidentNumber = data_enq_personAccidentNumber + 1;
      Logger().e("data_enq_personAccidentNumber ici apres Ajout du +1 :: $data_enq_personAccidentNumber \n");

    } else {
      //---- si nous somme en mode Modification
    }

    PersonResp? personResp = data_enq_onePersonCrash?.copyWith(
      typePerson: TypePerson,
      firstName: data_enq_firstName?.text,
      lastName: data_enq_lastName?.text,
      cni: data_enq_cni?.text,
      telephone: data_enq_telephone?.text,
      personAccidentNumber: data_enq_personAccidentNumber,
      vehicleAccidentNumber: data_enq_vehiculeChoise?.vehicleAccidentNumber,
      vehicleLinkedPedestrian: data_enq_vehiculeChoise?.vehicleAccidentNumber,
      birthDate: data_enq_birthDate?.text,
      gender: data_enq_gender,
      roadType: data_enq_personRoadType,
      range: data_enq_range,
      place: data_enq_place,
      traumaSeverity: data_enq_traumaSeverity,
      wearingHelmet: data_enq_wearingHelmet,
      occupantRestraintSystem: data_enq_occupantRestraintSystem,
      personAction: data_enq_personAction,
      alcoholConsumption: data_enq_alcoholConsumption,
      testStatus: data_enq_testStatus,
      testType: data_enq_testType,
      testResult: data_enq_testResult,
      drugUse: data_enq_drugUse,
      drivingLicenceYear: data_enq_drivingLicenceYear?.text,
      care: data_enq_care,
      personId: data_enq_personId,
      //images: data_enq_images,
      profession: data_enq_Profession,
      nopermis: data_enq_nopermis?.text,
      typepermis: 1,
      dateCreate: data_enq_personDateCreate,
      vgt_id: data_enq_data_enq_vgt_id,
      originalIndex: data_enq_originalIndex,
      types: data_enq_types,
    );


    if (personResp != null) {
      print("\n\n Dans le Update_list_Person je recoit et je fais l'équivalence \n ${personResp} \n\n\n");
      if (isUpdatePerson == false) {
        list_data_enq_persons?.add(personResp);
      } else {
        list_data_enq_persons?.removeWhere((element) =>
            element.personAccidentNumber == personResp.personAccidentNumber);
        list_data_enq_persons?.add(personResp);
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  //-----------Methode qui permet la recharge des donnees d'un personne selectionner dans le formulaire ------------//
  UpdateFormOnePersonSelect({required PersonResp? onePersonCrash}) {
    //--- add type person
    if (data_enq_onePersonCrash?.typePerson == "Chauffeur") {}
    data_enq_onePersonCrash = onePersonCrash;

    data_enq_personAccidentNumber_controller?.text = onePersonCrash?.personAccidentNumber.toString() ?? "";

    //----- recuperer la liste des vehicules et recupere le vehicule dont le numero est celui de la personne en utilisant where et ensuite first
    var elements = list_data_enq_vehicules?.where((element) => element.vehicleAccidentNumber == onePersonCrash?.vehicleAccidentNumber);
    if (elements != null) {
      data_enq_vehiculeChoise = elements.isNotEmpty ? elements.first : null;
    }else{
      data_enq_vehiculeChoise = null;
    }

    data_enq_firstName?.text = onePersonCrash?.firstName ?? "";
    data_enq_lastName?.text = onePersonCrash?.lastName ?? "";
    data_enq_cni?.text = onePersonCrash?.cni ?? "";
    data_enq_telephone?.text = onePersonCrash?.telephone ?? "";
    data_enq_personAccidentNumber_controller?.text = onePersonCrash?.personAccidentNumber?.toString() ?? "";
    data_enq_vehicleAccidentNumber_person =
        onePersonCrash?.vehicleAccidentNumber;
    data_enq_vehicleLinkedPedestrian = onePersonCrash?.vehicleLinkedPedestrian;
    data_enq_birthDate?.text = onePersonCrash?.birthDate ?? "";
    data_enq_gender = onePersonCrash?.gender;
    data_enq_personRoadType = onePersonCrash?.roadType;
    data_enq_range = onePersonCrash?.range;
    data_enq_place = onePersonCrash?.place;
    data_enq_traumaSeverity = onePersonCrash?.traumaSeverity;
    data_enq_wearingHelmet = onePersonCrash?.wearingHelmet;
    data_enq_occupantRestraintSystem = onePersonCrash?.occupantRestraintSystem;
    data_enq_personAction = onePersonCrash?.personAction;
    data_enq_alcoholConsumption = onePersonCrash?.alcoholConsumption;
    data_enq_testStatus = onePersonCrash?.testStatus;
    data_enq_testType = onePersonCrash?.testType;
    data_enq_testResult = onePersonCrash?.testResult;
    data_enq_drugUse = onePersonCrash?.drugUse;
    data_enq_drivingLicenceYear?.text = onePersonCrash?.drivingLicenceYear ?? "";
    data_enq_care = onePersonCrash?.care;
    data_enq_personId = onePersonCrash?.personId;
    data_enq_Profession = onePersonCrash?.profession;
    data_enq_nopermis?.text = onePersonCrash?.nopermis ?? "";
    //---- Ajouter le type de permit de conduire
    data_enq_personDateCreate = onePersonCrash?.dateCreate ?? "";
    data_enq_data_enq_vgt_id = onePersonCrash?.vgt_id;
    data_enq_originalIndex = onePersonCrash?.originalIndex;
    data_enq_types = onePersonCrash?.types;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  //--------- une methode qui permet de supprimer un personne de la liste des personnes
  DeletePerson({required PersonResp? personResp}) {
    list_data_enq_persons?.removeWhere((element) =>
        element.personAccidentNumber == personResp?.personAccidentNumber);
    notifyListeners();
  }

  //--- methode qui prend en paramettre un objet person et un int care et remplace avec l'objet person dans la liste des personnes dont numeroPersonne est egale a celui de la liste des personne
  UpdateLinkPersonInPatientCare({required PersonResp? New_personResp_after_link, required PersonResp? Old_personResp,}) {
    list_data_enq_persons?.removeWhere((element) => element.personAccidentNumber == Old_personResp?.personAccidentNumber);
    if(New_personResp_after_link != null){
      list_data_enq_persons?.add(New_personResp_after_link);
    }

    notifyListeners();
  }













  //--------------- Method Record All Select data Enquette - ----------------//

  Update_data_enq(Object? data_enq_receive){

    switch (data_enq_receive.runtimeType) {

    //-------- Collect ROAD data Accident Formulaire ----//
      case RoadTypeResp:
        {
          data_enq_road_type = data_enq_receive as RoadTypeResp?;
          print("Dans le Update_data_enq_road_type je reçois et je fais l'équivalence ${data_enq_receive?.value}");
        }break;

      case RoadStateResp:
        {
          data_enq_road_state = data_enq_receive as RoadStateResp?;
        }break;

      case RoadSlopSectionResp:
        {
          data_enq_slop_section = data_enq_receive as RoadSlopSectionResp?;
        }break;

      case ControlResp:
        {
          data_enq_control = data_enq_receive as ControlResp?;
        }break;

      case RoadCategoryResp:
        {
          data_enq_road_category = data_enq_receive as RoadCategoryResp?;
        }break;

      case BlockResp:
        {
          data_enq_block = data_enq_receive as BlockResp?;
        }break;

      case RoadIntersectionResp:
        {
          data_enq_road_intersection = data_enq_receive as RoadIntersectionResp?;
        }break;

      case VirageResp:
        {
          data_enq_virage = data_enq_receive as VirageResp?;
        }break;


    //-------- Collect ACCIDENT data Accident Formulaire ----//
      case DirectCauseResp:
        {
          data_enq_direct_cause = data_enq_receive as List<DirectCauseResp>?;
        }break;

      case CityResp:
        {
          data_enq_city = data_enq_receive as CityResp?;
          //print("Dans le Update_data_enq_road_type je recoit  ${data_enq_receive?.value}");
          //print("Dans le Update_data_enq_road_type je recoit et je fais l'equivalence  ${data_enq_city?.value}");
        }break;

      case MunicipalityResp:
        {
          data_enq_municipality = data_enq_receive as MunicipalityResp?;
        }break;

      case AccidentTypeResp:
        {
          data_enq_accident_type = data_enq_receive as AccidentTypeResp?;
        }break;

      case ClimaticConditionResp:
        {
          data_enq_climatic_condition = data_enq_receive as ClimaticConditionResp?;
        }break;

      case ImpactTypeResp:
        {
          data_enq_impact_type = data_enq_receive as ImpactTypeResp?;
        }break;

      case BrightnessConditionResp:
        {
          data_enq_brightness_condition =
              data_enq_receive as BrightnessConditionResp?;
        }
        break;

      case AccidentSeverityResp:
        {
          data_enq_accident_severity =
              data_enq_receive as AccidentSeverityResp?;
        }
        break;

      //-------- Collect data Accident Vehicule ----//

      case BrandResp:
        {
          data_enq_brand = data_enq_receive as BrandResp?;
        }
        break;

      case VehicleTypeResp:
        {
          data_enq_vehicle_type = data_enq_receive as VehicleTypeResp?;
        }
        break;

      case VehicleModelResp:
        {
          data_enq_vehicleModel = data_enq_receive as VehicleModelResp?;
        }
        break;

      case SpecialFunctionResp:
        {
          data_enq_specialFunction = data_enq_receive as SpecialFunctionResp?;
        }
        break;

      case VehicleActionResp:
        {
          data_enq_vehicleActionRespListSelect = data_enq_receive as VehicleActionResp?;
        }
        break;

      //-------- Collect data Accident Person ----//

      case PersonRoadTypeResp:
        {
          data_enq_personRoadType = data_enq_receive as PersonRoadTypeResp?;
        }
        break;

      case VehiculeResp:
        {
          data_enq_vehiculeChoise = data_enq_receive as VehiculeResp?;
        }break;

      case GenderResp:
        {
          data_enq_gender = data_enq_receive as GenderResp?;
        }
        break;

      case RoadTypeResp:
        {
          data_enq_road_type = data_enq_receive as RoadTypeResp?;
        }
        break;

      case SeatingRangeResp:
        {
          data_enq_range = data_enq_receive as SeatingRangeResp?;
        }
        break;

      case SeatingPlaceResp:
        {
          data_enq_place = data_enq_receive as SeatingPlaceResp?;
        }
        break;

      case TraumaSeverityResp:
        {
          data_enq_traumaSeverity = data_enq_receive as TraumaSeverityResp?;
        }
        break;

      case WearingHelmetResp:
        {
          data_enq_wearingHelmet = data_enq_receive as WearingHelmetResp?;
        }
        break;

      case OccupantRestraintSystemResp:
        {
          data_enq_occupantRestraintSystem =
              data_enq_receive as OccupantRestraintSystemResp?;
        }
        break;

      case ActionResp:
        {
          data_enq_personAction = data_enq_receive as ActionResp?;
        }
        break;

      case AlcoholConsumptionResp:
        {
          data_enq_alcoholConsumption =
              data_enq_receive as AlcoholConsumptionResp?;
        }
        break;

      case AlcoholTestStatusResp:
        {
          data_enq_testStatus = data_enq_receive as AlcoholTestStatusResp?;
        }
        break;

      case AlcoholTestTypeResp:
        {
          data_enq_testType = data_enq_receive as AlcoholTestTypeResp?;
        }
        break;

      case AlcoholTestResultResp:
        {
          data_enq_testResult = data_enq_receive as AlcoholTestResultResp?;
        }
        break;

      case PersonDrugUseResp:
        {
          data_enq_drugUse = data_enq_receive as PersonDrugUseResp?;
        }
        break;

      case ProfessionResp:
        {
          data_enq_Profession = data_enq_receive as ProfessionResp?;
        }
        break;

      default:
        {
          print(
              "object*********************** Errorrrrr Data Receive in Provider Collecte Data enquette+++++++++++  Errorrrrr++++++++++++++");
        }
    }

    UpdateDataFormEnquete();

    data_new_enquette = {
        "latitude": 4.915832801313164,
        "longitude": 9.140625000000002,
        "causes": [
          {"id": 2, "name": "Problème mécanique"},
          {"id": 4, "name": "Téléphone au volant"}
        ],

        "accidentType": data_enq_accident_type?.id ?? 1,
        "impactType": data_enq_impact_type?.id ?? 1,
        "climaticCondition": data_enq_climatic_condition?.id ?? 1,
        "brightnessCondition": data_enq_brightness_condition?.id ?? 1,
        "roadType": data_enq_road_type?.id ?? 1,
        "roadState": data_enq_road_state?.id ?? 2,
        "roadIntersection": data_enq_road_intersection?.id ?? 2,
        "block": data_enq_block?.id ?? 1,
        "roadTrafficControl":data_enq_control?.id ?? 2,
        "virage": data_enq_virage?.id ?? 2,
        "roadSlopSection": data_enq_slop_section?.id ?? 1,
        "accidentSeverity": data_enq_accident_severity?.id ?? 2,
        "accidentDate":GlobalMethod.convertirDateFrancais(date_accident_controller?.text),
        "city": data_enq_city?.id ?? 7,
        "municipality": data_enq_municipality?.id ?? 1 ,
        "place": "new MOB ${places_accident_controller?.text}",
        "roadCategory": data_enq_road_category?.id ?? 1,
        "accidentTime": time_accident_controller?.text ?? "11:14",
        "road": 0,
        "status": "OPENED",
        "vehicules": [],
        "persons": [],
        "crashImages": [],
        "id": 0
    };

    //--------- this is OK--------
/*
    data_new_enquette = {
      "accidentReq": {
        "latitude": 4.915832801313164,
        "longitude": 9.140625000000002,
        "causes": [
          {"id": 2, "name": "Problème mécanique"},
          {"id": 4, "name": "Téléphone au volant"}
        ],

        "accidentType": data_enq_accident_type?.code ?? 1,
        "impactType": data_enq_impact_type?.code ?? 1,
        "climaticCondition": data_enq_climatic_condition?.code ?? 1,
        "brightnessCondition": data_enq_brightness_condition?.code ?? 1,
        "roadType": data_enq_road_type?.code ?? 1,
        "roadState": data_enq_road_state?.id ?? 2,
        //"roadState": 1,
        "roadIntersection": data_enq_road_intersection?.code ?? 2,
        "block": data_enq_block?.code ?? 1,
        //"roadTrafficControl": 2,
        "roadTrafficControl":data_enq_control?.code ?? 2,
        "virage": data_enq_virage?.code ?? 2,
        //"roadSlopSection": 1,
        "roadSlopSection": data_enq_slop_section?.id ?? 1,
        "accidentSeverity": data_enq_accident_severity?.code ?? 2,
        "accidentDate":convertirDateFrancais(date_accident_controller?.text),
        "city": data_enq_city?.id ?? 7,
        "municipality": data_enq_municipality?.id ?? 1 ,
        "place": "MOB ${places_accident_controller?.text}",
        "roadCategory": data_enq_road_category?.code ?? 1,
        "accidentTime": time_accident_controller?.text ?? "11:14",
        "road": 0,
        "status": "OPENED",
        "vehicules": [],
        "persons": [],
        "crashImages": [],
        "id": 0
      }
    };
  */

    notifyListeners();
  }



  resetDataForm() {
    DataFormEnquete = EnquetteData();
    //--------- Reset ROAD data Accident Formulaire ----//
    data_enq_controller_locator = TextEditingController();
    data_enq_accident_position = null;
    data_enq_accident_type = null;
    data_enq_impact_type = null;
    data_enq_climatic_condition = null;
    data_enq_limite_vitesse = 0;
    data_enq_road_type = null;
    data_enq_road_state = null;
    data_enq_slop_section = null;
    data_enq_control = null;
    data_enq_road_category = null;
    data_enq_block = null;
    data_enq_road_intersection = null;
    data_enq_virage = null;

    //--------------- Reset info Accident data Accident -----------------//
    data_enq_ProviderPickImageDataCrashLocal = PickImageData();
    data_enq_city = null;
    data_enq_municipality = null;
    data_enq_accident_type = null;
    data_enq_climatic_condition = null;
    data_enq_impact_type = null;
    data_enq_brightness_condition = null;
    data_enq_accident_severity = null;
    date_accident_controller = TextEditingController();
    time_accident_controller = TextEditingController();
    places_accident_controller = TextEditingController();

    //--------------Reset data Car Crash -----------------//
    data_enq_ProviderPickImageVehiculeCrash = PickImageData();
    list_data_enq_vehicules = [];
    data_enq_num_vehicule_controller = TextEditingController();
    data_enq_num_immatriculation = TextEditingController();
    data_enq_num_chassis = TextEditingController();
    data_enq_year_model_vehicule = TextEditingController();
    data_enq_nbr_cylindre = TextEditingController();
    data_enq_brand = null;
    data_enq_vehicle_type = null;
    data_enq_vehicleModel = null;
    data_enq_specialFunction = null;
    data_enq_vehicleActionRespListSelect = null;
    data_enq_vehicleAccidentNumber_vehicule = 0;

    //------------Reset data Person Crash -----------------//
    data_enq_ProviderPickImagePersonCrash = PickImageData();
    list_data_enq_persons = [];
    data_enq_firstName = TextEditingController();
    data_enq_lastName = TextEditingController();
    data_enq_cni = TextEditingController();
    data_enq_telephone = TextEditingController();
    data_enq_num_vehicleChoise = TextEditingController();
    data_enq_vehiculeChoise = null;
    //data_enq_personAccidentNumber = 0;
    data_enq_vehicleAccidentNumber_person = 0;
    data_enq_vehicleLinkedPedestrian = 0;
    data_enq_birthDate = TextEditingController();
    data_enq_gender = null;
    data_enq_personRoadType = null;
    data_enq_range = null;
    data_enq_place = null;
    data_enq_traumaSeverity = null;
    data_enq_wearingHelmet = null;
    data_enq_occupantRestraintSystem = null;
    data_enq_personAction = null;
    data_enq_alcoholConsumption = null;
    data_enq_testStatus = null;
    data_enq_testType = null;
    data_enq_testResult = null;
    data_enq_drugUse = null;
    data_enq_drivingLicenceYear = TextEditingController();
    data_enq_care = 0;
    data_enq_personId = 0;
    data_enq_Profession = null;
    data_enq_nopermis = TextEditingController();
    data_enq_personDateCreate = DateTime.now().toString();
    data_enq_data_enq_vgt_id = 0;
    data_enq_originalIndex = 0;
    data_enq_types = "";



    //----------------------  gestion image drawing -----------------//
    data_enq_drawingCroquis = null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  setImageCrashLocalProvider() {
    data_enq_ProviderPickImageDataCrashLocal = PickImageData();
    notifyListeners();
  }

  setImageVehiculeProvider() {
    data_enq_ProviderPickImageVehiculeCrash = PickImageData();
    notifyListeners();
  }

  setImagePersonProvider() {
    data_enq_ProviderPickImagePersonCrash = PickImageData();
    notifyListeners();
  }

  resetDataFormPerson() {

    //------------Reset data Person Crash -----------------//
    data_enq_onePersonCrash = PersonResp();
    data_enq_ProviderPickImagePersonCrash = PickImageData();
    //list_data_enq_persons = [];
    data_enq_firstName = TextEditingController();
    data_enq_lastName = TextEditingController();
    data_enq_cni = TextEditingController();
    data_enq_telephone = TextEditingController();
    data_enq_num_vehicleChoise = TextEditingController();
    data_enq_personAccidentNumber_controller = TextEditingController();
    data_enq_personAccidentNumber_controller?.text = "1";
    data_enq_vehiculeChoise = null;
    //data_enq_personAccidentNumber = 0;
    data_enq_vehicleAccidentNumber_person = 0;
    data_enq_vehicleLinkedPedestrian = 0;
    data_enq_birthDate = TextEditingController();
    data_enq_gender = null;
    data_enq_personRoadType = null;
    data_enq_range = null;
    data_enq_place = null;
    data_enq_traumaSeverity = null;
    data_enq_wearingHelmet = null;
    data_enq_occupantRestraintSystem = null;
    data_enq_personAction = null;
    data_enq_alcoholConsumption = null;
    data_enq_testStatus = null;
    data_enq_testType = null;
    data_enq_testResult = null;
    data_enq_drugUse = null;
    data_enq_drivingLicenceYear = TextEditingController();
    data_enq_care = 0;
    data_enq_personId = 0;
    data_enq_Profession = null;
    data_enq_nopermis = TextEditingController();
    data_enq_personDateCreate = DateTime.now().toString();
    data_enq_data_enq_vgt_id = 0;
    data_enq_originalIndex = 0;
    data_enq_types = "";

    isUpdatePerson == false;

    int? data_enq_personAccidentNumber;
    data_enq_personAccidentNumber = data_enq_personAccidentNumber_controller?.text != null ? int.tryParse(data_enq_personAccidentNumber_controller?.text ??"") ?? 0 : 0;
    if (list_data_enq_persons == null || list_data_enq_persons?.length == 0) {
      data_enq_personAccidentNumber = 1;
    } else {
      data_enq_personAccidentNumber = list_data_enq_persons!.length + 1 ;
      //----- verifier si dans la liste des personnes il ya une personne qui a un personAccidentNumber = data_enq_personAccidentNumber si oui on incremente de 1 et verifier a nouveau jusqua ce que le personAccidentNumber n'existe pas dans la liste
      while (list_data_enq_persons!.any((element) => element.personAccidentNumber == data_enq_personAccidentNumber)) {
        data_enq_personAccidentNumber = data_enq_personAccidentNumber! + 1;
      }
    }

    data_enq_personAccidentNumber_controller?.text = data_enq_personAccidentNumber.toString() ;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  resetDataFormVehicule() {
    //--------------Reset data Car Crash -----------------//
    data_enq_oneVehiculeCrash = VehiculeResp();
    //list_data_enq_vehicules = [];
    data_enq_ProviderPickImageVehiculeCrash = PickImageData();
    data_enq_num_vehicule_controller = TextEditingController();
    data_enq_num_vehicule_controller?.text = "1";
    data_enq_num_immatriculation = TextEditingController();
    data_enq_num_chassis = TextEditingController();
    data_enq_year_model_vehicule = TextEditingController();
    data_enq_nbr_cylindre = TextEditingController();
    data_enq_brand = null;
    data_enq_vehicle_type = null;
    data_enq_vehicleModel = null;
    data_enq_specialFunction = null;
    data_enq_vehicleActionRespListSelect = null;
    //data_enq_vehicleAccidentNumber_vehicule = 0;

    isUpdateVehicule = false;

    if (list_data_enq_vehicules == null ||
        list_data_enq_vehicules?.length == 0) {
      data_enq_vehicleAccidentNumber_vehicule = 1;
    } else {
      data_enq_vehicleAccidentNumber_vehicule =list_data_enq_vehicules!.length + 1  ;
    }
    data_enq_num_vehicule_controller?.text = data_enq_vehicleAccidentNumber_vehicule.toString() ;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  refreshProviderCollecteDataEnquete() {
    notifyListeners();
  }
}