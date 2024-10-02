import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:http/http.dart' as http;
import 'package:secondtest/model/Class_setting/type_request_method.dart';
import 'package:secondtest/model/api_network_request/request_network_api.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/list_accident_provider/data_list_accident_provider.dart';

class ListAccidentRequest {

  BuildContext? context;
  ListAccidentRequest({
      this.context,
  });







  Future<Map<String, dynamic>?> respDataAccidentListRequest() async {

    RequestNetworkApi AccidentListRequest=RequestNetworkApi(
      context: context,
        EndPointUrl: "/accidents",
        dataBodyJson: {
          'page': '0',
          'size': '20',
          'search': '',
        },
        Description: "List Des Accident Declarer",
        typeResquestMethod: TypeResquestMethod.get
    );
    dynamic response = await AccidentListRequest.responseRequest();
    Map<String, dynamic>? respDataAccidentRequest = response?['data'];
    return respDataAccidentRequest;

  }














  Future<void> testCreateAccidentRequest() async {

    //-----------------------------Generate Token ---------------------------//
    print("+++++++++++++++++ DEBUT  GENERATEUR DE TOKEN  pour test create ACCIDENT++++++++++++++++++++++");
    await TokenManager.getToken();
    print("+++++++++++++++++ END  GENERATEUR DE TOKEN  pour test create ACCIDENT++++++++++++++++++++++");
    //-----------------------------print Token In LOG -----------------------//


    print("---------------------  print DEBUT REQUETTE CREATE ACCIDENT ------------");
    //--------------- Ajout du jeton d'authentification dans l'en-tête
    String? token = Constants.accessToken; // Remplacez par votre véritable jeton
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

      var request = http.MultipartRequest('POST', Uri.parse('http://51.195.11.202:8099/api/v1/accidents'));


    /// -------------  AUTRE METHODE DE CREATION D ENQUETTE ----------
    ///
    ///
    ///
    /*

    Map<String, dynamic> data_reqAccident_json  = {
      "latitude": 4.915832801313164,
      "longitude": 9.140625000000002,
      "causes": [
        {"id": 2, "name": "Problème mécanique"},
        {"id": 4, "name": "Téléphone au volant"}
      ],
      "accidentType": 1,
      "impactType": 3,
      "climaticCondition": 8,
      "brightnessCondition": 2,
      "roadType": 2,
      "roadState": 2,
      "roadIntersection": 2,
      "block": 1,
      "roadTrafficControl": 2,
      "virage": 2,
      "roadSlopSection": 1,
      "accidentSeverity": 2,
      "accidentDate": "07/03/2024",
      "city": 7,
      "municipality": 10,
      "place": "hasdigit new place",
      "roadCategory": 2,
      "accidentTime": "11:14",
      "road": 0,
      "vehicules": [],
      "persons": [],
      "crashImages": [],
      "id": 2
    };


    String data_reqAccident_json_convert = jsonEncode(data_reqAccident_json);

    print("////////////////////  Data Sent convert to String to Create Accident :::  $data_reqAccident_json_convert  /////////////////////////");

    request.fields.addAll({
      'accidentReq': data_reqAccident_json_convert
    });

*/




      Map<String, dynamic> data_reqAccident_json_all  = {
        "accidentReq": {
          "latitude": 4.915832801313164,
          "longitude": 9.140625000000002,
          "causes": [
            {"id": 2, "name": "Problème mécanique"},
            {"id": 4, "name": "Téléphone au volant"}
          ],
          "accidentType": 1,
          "impactType": 3,
          "climaticCondition": 8,
          "brightnessCondition": 2,
          "roadType": 2,
          "roadState": 2,
          "roadIntersection": 2,
          "block": 1,
          "roadTrafficControl": 2,
          "virage": 2,
          "roadSlopSection": 1,
          "accidentSeverity": 2,
          "accidentDate": "07/03/2024",
          "city": 7,
          "municipality": 10,
          "place": "hasdigit testing place",
          "roadCategory": 2,
          "accidentTime": "11:14",
          "road": 0,
          "vehicules": [],
          "persons": [],
          "crashImages": [],
          "id": 74
        }
      };

    data_reqAccident_json_all = context?.read<ProviderColleteDataEnquete>().data_new_enquette ?? data_reqAccident_json_all;

    print("////////////////////  Data Sent convert to String to Create Accident :::  $data_reqAccident_json_all  /////////////////////////");

    request.fields.addAll({
      data_reqAccident_json_all.keys.first: jsonEncode(data_reqAccident_json_all.values.first)
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

    print("---------------------  print FIN REQUETTE CREATE ACCIDENT ------------");

  }




  Future testEditAccidentRequest() async {

    //-----------------------------Generate Token ---------------------------//
    print("+++++++++++++++++ DEBUT  GENERATEUR DE TOKEN  pour test EDIT ACCIDENT++++++++++++++++++++++");
    await TokenManager.getToken();
    print("+++++++++++++++++ END  GENERATEUR DE TOKEN  pour test EDIT ACCIDENT++++++++++++++++++++++");
    //-----------------------------print Token In LOG -----------------------//


    print("---------------------  print DEBUT REQUETTE EDIT ACCIDENT ------------");
    //--------------- Ajout du jeton d'authentification dans l'en-tête
    String? token = Constants.accessToken; // Remplacez par votre véritable jeton
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest('POST', Uri.parse('http://51.195.11.202:8099/api/v1/accidents/update'));


    /// -------------  AUTRE METHODE DE CREATION D ENQUETTE ----------
/*
    Map<String, dynamic> data_reqAccident_json  = {
      "latitude": 4.915832801313164,
      "longitude": 9.140625000000002,
      "causes": [
        {"id": 2, "name": "Problème mécanique"},
        {"id": 4, "name": "Téléphone au volant"}
      ],
      "accidentType": 1,
      "impactType": 3,
      "climaticCondition": 8,
      "brightnessCondition": 2,
      "roadType": 2,
      "roadState": 2,
      "roadIntersection": 2,
      "block": 1,
      "roadTrafficControl": 2,
      "virage": 2,
      "roadSlopSection": 1,
      "accidentSeverity": 2,
      "accidentDate": "07/03/2024",
      "city": 7,
      "municipality": 10,
      "place": "hasdigit modify",
      "roadCategory": 2,
      "accidentTime": "11:14",
      "road": 0,
      "vehicules": [],
      "persons": [],
      "crashImages": [],
      "id": 164
    };


    String data_reqAccident_json_convert = jsonEncode(data_reqAccident_json);

    print("////////////////////  Data Sent convert to String to Edit Accident :::  $data_reqAccident_json_convert  /////////////////////////");

    request.fields.addAll({
      'accidentReq': data_reqAccident_json_convert
    });

*/




      Map<String, dynamic> data_reqAccident_json_all  = {
        "accidentReq": {
          "latitude": 4.915832801313164,
          "longitude": 9.140625000000002,
          "causes": [
            {"id": 2, "name": "Problème mécanique"},
            {"id": 4, "name": "Téléphone au volant"}
          ],
          "accidentType": 1,
          "impactType": 3,
          "climaticCondition": 8,
          "brightnessCondition": 2,
          "roadType": 2,
          "roadState": 2,
          "roadIntersection": 2,
          "block": 1,
          "roadTrafficControl": 2,
          "virage": 2,
          "roadSlopSection": 1,
          "accidentSeverity": 2,
          "accidentDate": "07/03/2024",
          "city": 7,
          "municipality": 10,
          "place": "hasdigit testing place",
          "roadCategory": 2,
          "accidentTime": "11:14",
          "road": 0,
          "status": "OPENED",
          "vehicules": [],
          "persons": [],
          "crashImages": [],
          "id": 164
        }

      };


    request.fields.addAll({
      data_reqAccident_json_all.keys.first: jsonEncode(data_reqAccident_json_all.values.first)
    });



    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

    print("---------------------  print FIN REQUETTE CREATE ACCIDENT ------------");

  }





/*
  Future<List<dynamic>?> respDataAccidentListRequest() async {

    //-----------------------------Generate Token ---------------------------//
    await TokenManager.getToken();
    //-----------------------------print Token In LOG -----------------------//


    print("/--------------------------- Debut execution Section Class Request API Method Get Data Accident------------------");
    logger.i("/----------(LIST ACCIDENT REQUEST)----------------- Debut Execution Section Class Request API Method Get Data Accident------------------");


    //-------------- URL de l'API et paramètres de la requête
    String url = '${Constants.BASE_URL_API}/accidents';

    //--------------- Paramettre de la Requette
    Map<String, String> queryParams = {
      'page': '0',
      'size': '150',
      'search': '',
    };

    //--------------- Ajout du jeton d'authentification dans l'en-tête
    String? token = Constants.accessToken; // Remplacez par votre véritable jeton
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };


    //--------------- Construction de l'URL complète avec les paramètres de requête
    String queryString = Uri(queryParameters: queryParams).query;
    String requestUrl = '$url?$queryString';


    //---------------- Envoi de la requête GET avec l'en-tête d'authentification
    logger.i("/-------------(LIST ACCIDENT REQUEST)--------------Execution Request API Method Get Data Accident API URL : $requestUrl------------------");
    http.Response response = await http.get(Uri.parse(requestUrl), headers: headers);

    //---------------- Vérification du code de statut de la réponse
    if (response.statusCode == 200) {
      //-------------- Traitement de la réponse
      String responseBody = response.body;
      //print('Réponse Body Api data Accident string is: $responseBody');

      //--------------- Conversion du JSON en une variable de type Map<String, dynamic>
      Map<String, dynamic> jsonDataResult = jsonDecode(
          utf8.decode(responseBody.codeUnits));

      List<dynamic> respDataAccidentRequest = jsonDataResult['data']['content'] ?? [];


      return respDataAccidentRequest;
    }
    else {
      print("++++++++++++++++ Error Request ------------  ${response.statusCode}");
      logger.e("/--------------(LIST ACCIDENT REQUEST)-------------Error Request Get Data Accident API URL : $requestUrl------------------");
    }


    logger.i("/-----------(LIST ACCIDENT REQUEST)----------------End Section Class Request API Method Get Data Accident------------------");
  }   */

}