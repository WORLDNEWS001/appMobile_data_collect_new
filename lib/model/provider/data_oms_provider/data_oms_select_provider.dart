
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/model/Class_setting/json_file_manger.dart';


import 'package:secondtest/model/api_network_request/data_oms/data_select_oms_request.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/CauseResp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/accident_severity_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/accident_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/brightness_condition_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/city_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/climatic_condition_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/impact_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Accident/municipality_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/action_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_consumption_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_test_result_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_test_status_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/alcohol_test_type_resp.dart';
import 'package:secondtest/model/class_data_oms_type/Person/categorie_person.dart';
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





class DataOmsSelectProvider with ChangeNotifier{

  //----------All List Data Select
  Map<String, dynamic>? allDataSelectOms = {};

  //---------- List map single
  List<Map<String, dynamic>> dataSelect = [];

  //---------------- Data Route

  //----------Data Select Type de Route ----
  List<RoadTypeResp?> roadTypeRespListSelect = [];
  // ---methode get on RoadTypeResp by RoadTypeResp.code
  RoadTypeResp? getRoadTypeRespById(int? code) {
    //return roadTypeRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = roadTypeRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = roadTypeRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }


  //----------Data Select causes auccident ----
  List<DirectCauseResp?> directCauseRespListSelect = [];

  // ---methode get on RoadTypeResp by RoadTypeResp.code
    DirectCauseResp? getDirectCauseById(int? code) {
    //return roadTypeRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = directCauseRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;

    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }





  List<PersonRoadTypeResp?> personRoadTypeRespListSelect = [];

  // ---methode get on RoadTypeResp by RoadTypeResp.code
  PersonRoadTypeResp? getPersonRoadTypeRespById(int? code) {
    //return roadTypeRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = personRoadTypeRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = personRoadTypeRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Etat de la Route ------------
  List<RoadStateResp?> roadStateRespListSelect = [];

  // ---methode get on RoadStateResp by RoadStateResp.code
  RoadStateResp? getRoadStateRespById(int? code) {
    //return roadStateRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = roadStateRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = roadStateRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select pente du troncon de la route ------------
  List<RoadSlopSectionResp?> roadSlopSectionRespListSelect = [];

  //--methode get on RoadSlopSectionResp by RoadSlopSectionResp.code
  RoadSlopSectionResp? getRoadSlopSectionRespById(int? code) {
    // Logger().w("\n\n\n   **********  data RoadSlopSectionResp --->> (code == $code) ******  \n $roadSlopSectionRespListSelect  \n\n\n");
    //return roadSlopSectionRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = roadSlopSectionRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = roadSlopSectionRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Controle de la circulation au careffour de la Route ------------
  List<ControlResp?> controlRespListSelect = [];

  //---methode get on ControlResp by ControlResp.code
  ControlResp? getControlRespById(int? code) {
    // return controlRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = controlRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = controlRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Categorie Fonctonnelle des routes ------------
  List<RoadCategoryResp?> roadCategoryRespListSelect = [];

  //---methode get on RoadCategoryResp by RoadCategoryResp.code
  RoadCategoryResp? getRoadCategoryRespById(int? code) {
    //return roadCategoryRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = roadCategoryRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = roadCategoryRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Obstacle Routier ------------
  List<BlockResp?> blockRespListSelect = [];

  //---methode get on BlockResp by BlockResp.code
  BlockResp? getBlockRespById(int? code) {
    //return blockRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = blockRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = blockRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Carrefour de la Route ------------
  List<RoadIntersectionResp?> roadIntersectionRespListSelect = [];

  //---methode get on RoadIntersectionResp by RoadIntersectionResp.code
  RoadIntersectionResp? getRoadIntersectionRespById(int? code) {
    //return roadIntersectionRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = roadIntersectionRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = roadIntersectionRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Virage de la Route ------------
  List<VirageResp?> virageRespListSelect = [];

  //--methode get on VirageResp by VirageResp.code
  VirageResp? getVirageRespById(int? code) {
    //return virageRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = virageRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = virageRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }







  //---------------- Data info Accident

  //----------Data Select Ville ----
  List<CityResp?> cityRespListSelect = [];

  //---methode get on CityResp by CityResp.code
  CityResp? getCityRespById(int id) {
    //return cityRespListSelect?.firstWhere((element) => element?.id == id, orElse:  null);
    var elements = cityRespListSelect.where((e) => e?.id == id);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = cityRespListSelect.where((e) => e?.id == id);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $id) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Municipalité------------
  List<MunicipalityResp?> municipalityRespListSelect = [];

  //---methode get on MunicipalityResp by MunicipalityResp.code
  MunicipalityResp? getMunicipalityRespById(int? code) {
    //Logger().w("\n\n\n   **********  data municipalityRespListSelect --->> (code == $code) ******  \n $municipalityRespListSelect  \n\n\n");
    //return municipalityRespListSelect?.firstWhere((element) => element?.id == code, orElse: null);
    var elements = municipalityRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = municipalityRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Type d'accident  ------------
  List<AccidentTypeResp?> accidentTypeRespListSelect = [];

  //---methode get on AccidentTypeResp by AccidentTypeResp.code
  AccidentTypeResp? getAccidentTypeRespById(int? code) {
    //return accidentTypeRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = accidentTypeRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = accidentTypeRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Conditions Climatiques ------------
  List<ClimaticConditionResp?> climaticConditionRespListSelect = [];

  //---methode get on ClimaticConditionResp by ClimaticConditionResp.code
  ClimaticConditionResp? getClimaticConditionRespById(int? code) {
    //return climaticConditionRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = climaticConditionRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = climaticConditionRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Type d'impact  ------------
  List<ImpactTypeResp?> impactTypeRespListSelect = [];

  //---methode get on ImpactTypeResp by ImpactTypeResp.code
  ImpactTypeResp? getImpactTypeRespById(int? code) {
    //return impactTypeRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = impactTypeRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = impactTypeRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Obstacle Routier ------------
  List<BrightnessConditionResp?> brightnessConditionRespListSelect = [];

  //---methode get on BrightnessConditionResp by BrightnessConditionResp.code
  BrightnessConditionResp? getBrightnessConditionRespById(int? code) {
    //return brightnessConditionRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements =
        brightnessConditionRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements =
          brightnessConditionRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Carrefour de la Route ------------
  List<AccidentSeverityResp?> accidentSeverityRespListSelect = [];

  //---methode get on AccidentSeverityResp by AccidentSeverityResp.code
  AccidentSeverityResp? getAccidentSeverityRespById(int? code) {
    // Logger().w("\n\n\n   **********  data accidentSeverityRespListSelect --->> (code == $code) ******  \n $accidentSeverityRespListSelect  \n\n\n");
    /*
        AccidentSeverityResp? ChoiseData= accidentSeverityRespListSelect?.firstWhere((element) {
          print("\n\n element?.id est==  ${element?.code} \n et code est == $code \n\n");
          return element?.id == code;
        },  orElse: null);
        print("\n data choise is  --->> $ChoiseData  \n");
        return ChoiseData;
         */
    var elements = accidentSeverityRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = accidentSeverityRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //---------------- Data info vehicule

  //----------Data Select Marque du Véhicule----
  List<BrandResp?> brandRespListSelect = [];

  //---methode get on BrandResp by BrandResp.code
  BrandResp? getBrandRespById(int? code) {
    //Logger().w("\n\n\n   **********  data brandRespListSelect --->> (code == $code) ******  \n $brandRespListSelect  \n\n\n");
    //return brandRespListSelect?.firstWhere((element) => element?.id == code, orElse: null);
    var elements = brandRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = brandRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Type du Véhicule------------
  List<VehicleTypeResp?> vehicleTypeRespListSelect = [];

  //--- methode get on VehicleTypeResp by VehicleTypeResp.code
  VehicleTypeResp? getVehicleTypeRespById(int? code) {
    //Logger().w("\n\n\n   **********  data vehicleTypeRespListSelect --->> (code == $code) ******  \n $vehicleTypeRespListSelect  \n\n\n");
    //return vehicleTypeRespListSelect.firstWhere((element) => element?.id == code, orElse:  functionReturnOrElse() );
    var elements = vehicleTypeRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = vehicleTypeRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Modèle du Véhicule  ------------
  List<VehicleModelResp?> vehicleModelRespListSelect = [];

  //---methode get on VehicleModelResp by VehicleModelResp.code

  VehicleModelResp? getVehicleModelRespById(int? code) {
    // Logger().w("\n\n\n   **********  data vehicleModelRespListSelect --->> (code == $code) ******  \n $vehicleModelRespListSelect  \n\n\n");
    // return vehicleModelRespListSelect?.firstWhere((element) => element?.id == code, orElse:  functionReturnOrElse());
    var elements = vehicleModelRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = vehicleModelRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  functionReturnOrElse() {
    return null;
  }

  //----------Data Select Fonction spéciale du Véhicule ------------
  List<SpecialFunctionResp?> specialFunctionRespListSelect = [];

  //---methode get on SpecialFunctionResp by SpecialFunctionResp.code
  SpecialFunctionResp? getSpecialFunctionRespById(int? code) {
    // Logger().w("\n\n\n   **********  data specialFunctionRespListSelect --->> (code == $code) ******  \n $specialFunctionRespListSelect  \n\n\n");
    // return specialFunctionRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = specialFunctionRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = specialFunctionRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Manoeuvre du Véhicule  ------------
  List<VehicleActionResp?> vehicleActionRespListSelect = [];

  //---methode get on VehicleActionResp by VehicleActionResp.code
  VehicleActionResp? getVehicleActionRespById(int? code) {
    //return vehicleActionRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = vehicleActionRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = vehicleActionRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //---------------- Data info Accidentés

  //----------Data Select Type usager de la route----
  /*
  List<PersonRoadTypeResp?> personRoadTypeRespListSelect = [];

  //---methode get on PersonRoadTypeResp by PersonRoadTypeResp.code
  PersonRoadTypeResp? getPersonRoadTypeRespById(int? code) {
    //return personRoadTypeRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = personRoadTypeRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = personRoadTypeRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

   */

  //----------Data Select Categorie Fonctonnelle des routes ------------
  List<ActionResp?> actionRespListSelect = [];

  //---methode get on RoadCategoryResp by RoadCategoryResp.code
  ActionResp? getActionRespById(int? code) {
    //return actionRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = actionRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    // if(element == null){
    //   elements = actionRespListSelect.where((e) => e?.id == code);
    //   element = elements.isNotEmpty ? elements.first : null;
    // }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Gravité des traumatismes-----------
  List<TraumaSeverityResp?> traumaSeverityRespListSelect = [];

  //---methode get on TraumaSeverityResp by TraumaSeverityResp.code
  TraumaSeverityResp? getTraumaSeverityRespById(int? code) {
    // Logger().w("\n\n\n   **********  data traumaSeverityRespListSelect --->> (code == $code) ******  \n $traumaSeverityRespListSelect  \n\n\n");
    //return traumaSeverityRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = traumaSeverityRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = traumaSeverityRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Sexe genre ------------
  List<GenderResp?> genderRespListSelect = [];

  //---methode get on GenderResp by GenderResp.code
  GenderResp? getGenderRespById(int? code) {
    //return genderRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = genderRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = genderRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Consommation alcool soupçonnée------------
  List<AlcoholConsumptionResp?> alcoholConsumptionRespListSelect = [];

  //---methode get on AlcoholConsumptionResp by AlcoholConsumptionResp.code
  AlcoholConsumptionResp? getAlcoholConsumptionRespById(int? code) {
    //return alcoholConsumptionRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = alcoholConsumptionRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = alcoholConsumptionRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Statut du Test  ------------
  List<AlcoholTestStatusResp?> alcoholTestStatusRespListSelect = [];

  //---methode get on AlcoholTestStatusResp by AlcoholTestStatusResp.code
  AlcoholTestStatusResp? getAlcoholTestStatusRespById(int? code) {
    //return alcoholTestStatusRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = alcoholTestStatusRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = alcoholTestStatusRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Type de Test----
  List<AlcoholTestTypeResp?> alcoholTestTypeRespListSelect = [];

  //---methode get on AlcoholTestTypeResp by AlcoholTestTypeResp.code
  AlcoholTestTypeResp? getAlcoholTestTypeRespById(int? code) {
    //return alcoholTestTypeRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = alcoholTestTypeRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = alcoholTestTypeRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Resultat des Tests------------
  List<AlcoholTestResultResp?> alcoholTestResultRespListSelect = [];

  //---methode get on AlcoholTestResultResp by AlcoholTestResultResp.code
  AlcoholTestResultResp? getAlcoholTestResultRespById(int? code) {
    //return alcoholTestResultRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);
    var elements = alcoholTestResultRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = alcoholTestResultRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Dispositifs des occupants  ------------
  List<OccupantRestraintSystemResp?> occupantRestraintSystemRespListSelect = [];

  //---methode get on OccupantRestraintSystemResp by OccupantRestraintSystemResp.code
  OccupantRestraintSystemResp? getOccupantRestraintSystemRespById(int? code) {
    //return occupantRestraintSystemRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements =
        occupantRestraintSystemRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements =
          occupantRestraintSystemRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Port du casque  ------------
  List<WearingHelmetResp?> wearingHelmetRespListSelect = [];

  //---methode get on WearingHelmetResp by WearingHelmetResp.code
  WearingHelmetResp? getWearingHelmetRespById(int? code) {
    //return wearingHelmetRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = wearingHelmetRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = wearingHelmetRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select  Rangée   ------------
  List<SeatingRangeResp?> seatingRangeRespListSelect = [];

  //---methode get on SeatingRangeResp by SeatingRangeResp.code
  SeatingRangeResp? getSeatingRangeRespById(int? code) {
    //return seatingRangeRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = seatingRangeRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = seatingRangeRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Place Siège------------
  List<SeatingPlaceResp?> seatingPlaceRespListSelect = [];

  //---methode get on SeatingPlaceResp by SeatingPlaceResp.code
  SeatingPlaceResp? getSeatingPlaceRespById(int? code) {
    //return seatingPlaceRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = seatingPlaceRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = seatingPlaceRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select consommation des drogues  ------------
  List<PersonDrugUseResp?> personDrugUseRespListSelect = [];

  //---methode get on PersonDrugUseResp by PersonDrugUseResp.code
  PersonDrugUseResp? getPersonDrugUseRespById(int? code) {
    //return personDrugUseRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = personDrugUseRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    if (element == null) {
      elements = personDrugUseRespListSelect.where((e) => e?.code == code);
      element = elements.isNotEmpty ? elements.first : null;
    }
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  //----------Data Select Profession de l'accidenté  ------------
  List<ProfessionResp?> professionRespListSelect = [];

  //---methode get on PersonDrugUseResp by PersonDrugUseResp.code
  ProfessionResp? getProfessionRespById(int? code) {
    // Logger().w("\n\n\n   **********  data professionRespListSelect --->> (code == $code) ******  \n $professionRespListSelect  \n\n\n");
    //return professionRespListSelect?.firstWhere((element) => element?.id == code, orElse:  null);

    var elements = professionRespListSelect.where((e) => e?.id == code);
    var element = elements.isNotEmpty ? elements.first : null;
    //if(element == null){
    // elements = professionRespListSelect.where((e) => e?.code == code);
    // element = elements.isNotEmpty ? elements.first : null;
    //}
    //Logger().w("\n\n\n   **********  data Choisii--->> (code == $code) ******  \n $element  \n\n\n");
    return element;
  }

  UpdateDataOmsSelectProvider({BuildContext? context}) async{

    await SelectDataOmsRequest(context: context).respSelectDataOmsRequest().then((jsonData) async {

      if (jsonData == null || jsonData.isEmpty){
        // Lecture depuis le fichier JSON
        jsonData = await JsonFileManager.readFromJson(nameFileJson: "dataOmsResultApi");
        print('Data read from JSON: $jsonData');
      }else{
        // Écriture dans le fichier JSON
        await JsonFileManager.writeToJson(data: jsonData, nameFileJson: "dataOmsResultApi");
      }

      allDataSelectOms = jsonData;





      //-------------------- Take Data oms Route
      dataSelect =allDataSelectOms?["roadTypeResp"].cast<Map<String, dynamic>>();
      roadTypeRespListSelect = RoadTypeResp.listFromJson(dataSelect);

      notifyListeners();
      print("++++++++  PROVIDER Type   roadTypeListSelect  ++++++++++++ ${roadTypeRespListSelect.runtimeType}");
      print("++++++++  PROVIDER taille   roadTypeListSelect  ++++++++++++ ${roadTypeRespListSelect.length}");

      roadTypeRespListSelect.forEach((element) {
        print("la value de ce type de route est:  ${element?.value}");
      });

      print("++++++++ ++++++");
      dataSelect= allDataSelectOms?["roadStateResp"].cast<Map<String, dynamic>>();
      roadStateRespListSelect = dataSelect.map((oneMap) => RoadStateResp.fromMap(oneMap)).toList();
      print("++++++++  PROVIDER Type   roadStateRespListSelect  ++++++++++++ ${roadStateRespListSelect.runtimeType}");
      print("++++++++  PROVIDER taille   roadStateRespListSelect  ++++++++++++ ${roadStateRespListSelect.length}");

      roadStateRespListSelect.forEach((element) {
        print("la value de etat de la route est:  ${element?.value}");
      });

      print("++++++++ ++++++");
      print("++++++++ ++++++");

        dataSelect = allDataSelectOms?["roadSlopSectionResp"].cast<Map<String, dynamic>>();


        roadSlopSectionRespListSelect = dataSelect.map((oneMap) => RoadSlopSectionResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["controlResp"].cast<Map<String, dynamic>>();
        controlRespListSelect = dataSelect.map((oneMap) => ControlResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["roadCategoryResp"].cast<Map<String, dynamic>>();
        roadCategoryRespListSelect = dataSelect.map((oneMap) => RoadCategoryResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["blockResp"].cast<Map<String, dynamic>>();
        blockRespListSelect = dataSelect.map((oneMap) => BlockResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["roadIntersectionResp"].cast<Map<String, dynamic>>();
        roadIntersectionRespListSelect = dataSelect.map((oneMap) => RoadIntersectionResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["virageResp"].cast<Map<String, dynamic>>();
        virageRespListSelect = dataSelect.map((oneMap) => VirageResp.fromMap(oneMap)).toList();


//--- la liste de tour les pv refuser dans tout les centre de visite technique
      //--- ceux qui ont ete resuser et qui sonr aller faire encore la visite apres un refus dans une delaie de 15 jour
      //-- ceux qui ont ete resuser et qui sonr aller faire encore la visite apres un refus dans une delaie de 15 jour par un autre centre de viste technique
      //--- ceux qui on ete accepter apres un refus dans un autre centre de visite technique
      //--- ceux qui on ete accepter apres un refus dans un autre centre de visite technique et qui on fait la visite dans un autre centre de visite technique
      //--- ceux qui on ete accepter apres un refus dans un autre centre de visite technique et qui on fait la visite dans un autre centre de visite technique et qui on ete resuser


      //------------------------ Take Data Select Oms Accident Info
        dataSelect = allDataSelectOms?["directCauseResp"].cast<Map<String, dynamic>>();
        directCauseRespListSelect = dataSelect.map((oneMap) => DirectCauseResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["cityResp"].cast<Map<String, dynamic>>();
        cityRespListSelect = dataSelect.map((oneMap) => CityResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["municipalityResp"].cast<Map<String, dynamic>>();
        municipalityRespListSelect = dataSelect.map((oneMap) => MunicipalityResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["accidentTypeResp"].cast<Map<String, dynamic>>();
        accidentTypeRespListSelect = dataSelect.map((oneMap) => AccidentTypeResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["climaticConditionResp"].cast<Map<String, dynamic>>();
        climaticConditionRespListSelect = dataSelect.map((oneMap) => ClimaticConditionResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["impactTypeResp"].cast<Map<String, dynamic>>();
        impactTypeRespListSelect = dataSelect.map((oneMap) => ImpactTypeResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["brightnessConditionResp"].cast<Map<String, dynamic>>();
        brightnessConditionRespListSelect = dataSelect.map((oneMap) => BrightnessConditionResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["accidentSeverityResp"].cast<Map<String, dynamic>>();
        accidentSeverityRespListSelect = dataSelect.map((oneMap) => AccidentSeverityResp.fromMap(oneMap)).toList();


      //------------------------------ Take Data Oms vehicule


        dataSelect= allDataSelectOms?["brandResp"].cast<Map<String, dynamic>>();
        brandRespListSelect = dataSelect.map((oneMap) => BrandResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["vehicleTypeResp"].cast<Map<String, dynamic>>();
        vehicleTypeRespListSelect = dataSelect.map((oneMap) => VehicleTypeResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["vehicleModelResp"].cast<Map<String, dynamic>>();
        vehicleModelRespListSelect = dataSelect.map((oneMap) => VehicleModelResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["specialFunctionResp"].cast<Map<String, dynamic>>();
        specialFunctionRespListSelect = dataSelect.map((oneMap) => SpecialFunctionResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["vehicleActionResp"].cast<Map<String, dynamic>>();
        vehicleActionRespListSelect = dataSelect.map((oneMap) => VehicleActionResp.fromMap(oneMap)).toList();



      //-------------------------------  Take Data Oms Person



        dataSelect= allDataSelectOms?["personRoadTypeResp"].cast<Map<String, dynamic>>();
        personRoadTypeRespListSelect = dataSelect.map((oneMap) => PersonRoadTypeResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["traumaSeverityResp"].cast<Map<String, dynamic>>();
        traumaSeverityRespListSelect = dataSelect.map((oneMap) => TraumaSeverityResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["genderResp"].cast<Map<String, dynamic>>();
        genderRespListSelect = dataSelect.map((oneMap) => GenderResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["alcoholConsumptionResp"].cast<Map<String, dynamic>>();
        alcoholConsumptionRespListSelect = dataSelect.map((oneMap) => AlcoholConsumptionResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["alcoholTestStatusResp"].cast<Map<String, dynamic>>();
        alcoholTestStatusRespListSelect = dataSelect.map((oneMap) => AlcoholTestStatusResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["alcoholTestTypeResp"].cast<Map<String, dynamic>>();
        alcoholTestTypeRespListSelect = dataSelect.map((oneMap) => AlcoholTestTypeResp.fromMap(oneMap)).toList();

        dataSelect= allDataSelectOms?["alcoholTestResultResp"].cast<Map<String, dynamic>>();
        alcoholTestResultRespListSelect = dataSelect.map((oneMap) => AlcoholTestResultResp.fromMap(oneMap)).toList();

      dataSelect = allDataSelectOms?["occupantRestraintSystemResp"]
          .cast<Map<String, dynamic>>();
      occupantRestraintSystemRespListSelect = dataSelect
          .map((oneMap) => OccupantRestraintSystemResp.fromMap(oneMap))
          .toList();

      dataSelect =
          allDataSelectOms?["wearingHelmetResp"].cast<Map<String, dynamic>>();
      wearingHelmetRespListSelect = dataSelect
          .map((oneMap) => WearingHelmetResp.fromMap(oneMap))
          .toList();

      dataSelect =
          allDataSelectOms?["seatingRangeResp"].cast<Map<String, dynamic>>();
      seatingRangeRespListSelect =
          dataSelect.map((oneMap) => SeatingRangeResp.fromMap(oneMap)).toList();

      dataSelect =
          allDataSelectOms?["seatingPlaceResp"].cast<Map<String, dynamic>>();
      seatingPlaceRespListSelect =
          dataSelect.map((oneMap) => SeatingPlaceResp.fromMap(oneMap)).toList();

      dataSelect =
          allDataSelectOms?["personDrugUseResp"].cast<Map<String, dynamic>>();
      personDrugUseRespListSelect = dataSelect
          .map((oneMap) => PersonDrugUseResp.fromMap(oneMap))
          .toList();

      dataSelect =
          allDataSelectOms?["professionResp"].cast<Map<String, dynamic>>();
      professionRespListSelect =
          dataSelect.map((oneMap) => ProfessionResp.fromJson(oneMap)).toList();

      dataSelect = allDataSelectOms?["actionResp"].cast<Map<String, dynamic>>();
      actionRespListSelect =
          dataSelect.map((oneMap) => ActionResp.fromMap(oneMap)).toList();

      notifyListeners();
      /*
      print("++++++++  PROVIDER Type   roadTypeListSelect  ++++++++++++ ${roadStateRespListSelect.runtimeType}");
      print("++++++++  PROVIDER taille   roadTypeListSelect  ++++++++++++ ${roadStateRespListSelect?.length}");

      roadStateRespListSelect.forEach((element) {
        print("la value de ce type de route est:  ${element.value}");
      });

      print("++++++++ ++++++");

       */

    });


  }



}