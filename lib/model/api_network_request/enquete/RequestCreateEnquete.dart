
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:http/http.dart' as http;
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';






//-----------------------------  METHODE DE REQUETTE AVEC DIO TO CREATE ENQUETTE ---------------------------//

Future<Map<String, dynamic>?> CreateEnqueteRequestDio({required Map<String, dynamic>? json_data_send })  async {
  var dio = Dio();
  Map<String, dynamic>? resultRequest;
  //-----------------------------Generate Token ---------------------------//
  Logger().d("+++++( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )++++ DEBUT  GENERATEUR DE TOKEN  pour test create ACCIDENT++++++++++++++++++++++");
  await TokenManager.getToken();
  print("+++++++++++++++++ END  GENERATEUR DE TOKEN  pour test create ACCIDENT++++++++++++++++++++++");
  //-----------------------------print Token In LOG -----------------------//

  print("------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- DEBUT REQUETTE CREATE ACCIDENT ------------");
  //--------------- Ajout du jeton d'authentification dans l'en-tête
  String? token = Constants.accessToken; // Remplacez par votre véritable jeton
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
  };

  dio.options.headers['Authorization'] = 'Bearer $token';

  //Map<String, dynamic> data_reqAccident_json_all = context.read<ProviderColleteDataEnquete>().data_new_enquette ?? {};


  FormData formData = FormData.fromMap({
    "accidentReq": jsonEncode(json_data_send),
    // Ajoutez les images si nécessaire
    // "crashImage": await MultipartFile.fromFile('path_to_image', filename: 'image_name.png'),
  });

  try {
    var response = await dio.post('${Constants.BASE_URL_API}/accidents/',
      data: formData,
    );

    if (response.statusCode == 200) {
      Logger().w(" -------------//++++++++++++//++++++++++  RESULT REQUETTE CREATE ACCIDENT ---\n\n  ${response.data} \n\n");
      resultRequest = response.data;
    } else {
      print('-----------( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )-----La requête a échoué avec le statut: ${response.statusCode}.');
    }
  } catch (e) {
    print('---( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )----Une erreur est survenue lors de l\'envoi de la requête: $e');
  }

  Logger().e("------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- FIN REQUETTE CREATE ACCIDENT ------------");
  return resultRequest;

}







//-----------------------------  METHODE DE REQUETTE AVEC DIO TO EDIT ENQUETTE ---------------------------//


Future<Map<String, dynamic>?> EditEnqueteRequestDio({required Map<String, dynamic>? json_data_send })  async {
  var dio = Dio();
  Map<String, dynamic>? resultRequest;
  //-----------------------------Generate Token ---------------------------//
  Logger().d(
      "+++++( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )++++ DEBUT  GENERATEUR DE TOKEN  pour  EDIT ACCIDENT++++++++++++++++++++++");
  await TokenManager.getToken();
  print(
      "+++++++++++++++++ END  GENERATEUR DE TOKEN  pour  MODIFIER ACCIDENT++++++++++++++++++++++");
  //-----------------------------print Token In LOG -----------------------//

  print(
      "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- DEBUT REQUETTE MODIFIER ACCIDENT ------------");

  Logger().w(
      "-------------\n DATA SEND TO EDIT ACCIDENT  ::::  $json_data_send  -----------------");
  //--------------- Ajout du jeton d'authentification dans l'en-tête
  String? token = Constants.accessToken; // Remplacez par votre véritable jeton
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
  };
  dio.options.headers['Authorization'] = 'Bearer $token';

  //Map<String, dynamic> data_reqAccident_json_all = context.read<ProviderColleteDataEnquete>().data_new_enquette ?? {};

  FormData formData = FormData.fromMap({
    "accidentReq": jsonEncode(json_data_send),
    // Ajoutez les images si nécessaire
    // "crashImage": await MultipartFile.fromFile('path_to_image', filename: 'image_name.png'),
  });



  try {

    var response = await dio.post('${Constants.BASE_URL_API}/accidents/update',
      data: formData,
    );

    if (response.statusCode == 200) {
      Logger().w(" -------------//++++++++++++//++++++++++  RESULT REQUETTE EDIT ACCIDENT ---\n\n  ${response.data} \n\n");
      resultRequest = response.data;

    } else {
      print('-----------( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )-----La requête modification enquete a échoué avec le statut: ${response.statusCode}.');
    }

  } catch (e) {
    print('---( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )----modification enquete   :: Une erreur est survenue lors de l\'envoi de la requête: $e');
  }

  Logger().e("------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- FIN REQUETTE EDIT ACCIDENT ------------");

  return resultRequest;
}










//------------ METHODE DE REQUETTE AVEC DIO TO GET ENQUETTE DATA BY ID---------------------------//

Future<Map<String, dynamic>?> GetEnqueteRequestDio({required int? id_enquete })  async {
  var dio = Dio();
  //-----------------------------Generate Token ---------------------------//
  Logger().d("+++++( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )++++ DEBUT  GENERATEUR DE TOKEN  pour GET ACCIDENT ID = $id_enquete++++++++++++++++++++++");
  await TokenManager.getToken();
  print("+++++++++++++++++ END  GENERATEUR DE TOKEN  POUR  GET ACCIDENT ID = $id_enquete + +++++++++++++++++++++");
  //-----------------------------print Token In LOG -----------------------//

  print("------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- DEBUT REQUETTE GET ACCIDENT ID = $id_enquete ------------");
  //--------------- Ajout du jeton d'authentification dans l'en-tête
  String? token = Constants.accessToken; // Remplacez par votre véritable jeton
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
  };
  dio.options.headers['Authorization'] = 'Bearer $token';

  //Map<String, dynamic> data_reqAccident_json_all = context.read<ProviderColleteDataEnquete>().data_new_enquette ?? {};

  try {


    Map<String, dynamic> resultDataRequest = {};
    var response = await dio.get('${Constants.BASE_URL_API}/accidents/$id_enquete',);

    if (response.statusCode == 200) {
      Logger().w(" -------------//++++++++++++//++++++++++  RESULT REQUETTE GET ACCIDENT ID = $id_enquete response.data --->>> \n\n  ${response.data} \n\n");
      //Logger().w(" -------------//++++++++++++//++++++++++  RESULT REQUETTE GET ACCIDENT response.data --->>> \n\n  ${response.data["data"]} \n\n");
      //------- RETURN RESPONSE DATA TO MAP<String, dynamic>
      resultDataRequest = response.data;
      return response.data;

    } else {
      print('-----------( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )-----La requête GET enquete ID = $id_enquete a échoué avec le statut: ${response.statusCode}.');
    }

  } catch (e) {
    print('---( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )----GET enquete ID = $id_enquete   :: Une erreur est survenue lors de l\'envoi de la requête: $e');
  }

  Logger().e("------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- FIN REQUETTE GET ACCIDENT ID = $id_enquete------------");

}


































/*
Future<Map<String, dynamic>?> CreateAccidentRequest({required Map<String, dynamic>? json_data_send }) async {

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


  Map<String, dynamic>? data_reqAccident_json_all = {};


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

      //data_reqAccident_json_all = context?.read<ProviderColleteDataEnquete>().data_new_enquette ?? data_reqAccident_json_all;


    print("////////////////////  Data Sent convert to String to Create Accident :::  $data_reqAccident_json_convert  /////////////////////////");

    request.fields.addAll({
      'accidentReq': data_reqAccident_json_convert
    });





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


 */


  data_reqAccident_json_all = json_data_send;
  print("////////////////////  Data Sent convert to String to Create Accident :::  $data_reqAccident_json_all  /////////////////////////");

  request.fields.addAll({
    data_reqAccident_json_all!.keys.first: jsonEncode(data_reqAccident_json_all.values.first)
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  //----- waiting 2 milliseconds
  await Future.delayed(Duration(milliseconds: 2));

  if (response.statusCode == 200) {


    //print(await response.stream.bytesToString());
    String responseBody = await response.stream.bytesToString();
    print(responseBody);


    // -- convert response to Map<String, dynamic>
    Map<String, dynamic> jsonDataResult = jsonDecode(responseBody);
    //----- waiting 2 milliseconds
    await Future.delayed(Duration(milliseconds: 2));
    return jsonDataResult;


  }
  else {
    print(response.reasonPhrase);
  }

  print("---------------------  print FIN REQUETTE CREATE ACCIDENT ------------");

}





Future<Map<String, dynamic>?> CreateAccidentRequestProvider({required BuildContext context}) async {

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


  Map<String, dynamic>? data_reqAccident_json_all = {};


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

      //data_reqAccident_json_all = context?.read<ProviderColleteDataEnquete>().data_new_enquette ?? data_reqAccident_json_all;


    print("////////////////////  Data Sent convert to String to Create Accident :::  $data_reqAccident_json_convert  /////////////////////////");

    request.fields.addAll({
      'accidentReq': data_reqAccident_json_convert
    });





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


 */


  data_reqAccident_json_all = context.read<ProviderColleteDataEnquete>().data_new_enquette ?? data_reqAccident_json_all;

  //data_reqAccident_json_all = json_data_send;
  print("////////////////////  Data Sent convert to String to Create Accident :::  $data_reqAccident_json_all  /////////////////////////");

  request.fields.addAll({
    data_reqAccident_json_all!.keys.first: jsonEncode(data_reqAccident_json_all.values.first)
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  //----- waiting 2 milliseconds
  //await Future.delayed(Duration(milliseconds: 2));

  if (response.statusCode == 200) {


    //print(await response.stream.bytesToString());
    String responseBody = await response.stream.bytesToString();
    print(responseBody);


    // -- convert response to Map<String, dynamic>
    Map<String, dynamic> jsonDataResult = jsonDecode(responseBody);
    //----- waiting 2 milliseconds
    await Future.delayed(Duration(milliseconds: 2));
    return jsonDataResult;


  }
  else {
    print(response.reasonPhrase);
  }

  print("---------------------  print FIN REQUETTE CREATE ACCIDENT ------------");

}





Future<void> sendAccidentReport(BuildContext context) async {
  var uri = Uri.parse('http://51.195.11.202:8099/api/v1/accidents/');

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


  Map<String, dynamic> data_reqAccident_json_all = context.read<ProviderColleteDataEnquete>().data_new_enquette ?? {};

  var request = http.MultipartRequest('POST', uri)
    ..headers['Authorization'] = 'Bearer $token'
    ..fields['accidentReq'] = json.encode(data_reqAccident_json_all);

  // Ajoutez les images si nécessaire
  // request.files.add(await http.MultipartFile.fromPath(
  //   'crashImage',
  //   'path_to_image',
  // ));

  try {
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var map = json.decode(responseString);
      print(map);
    } else {
      print('La requête a échoué avec le statut: ${response.statusCode}.');
    }
  } catch (e) {
    print('Une erreur est survenue lors de l\'envoi de la requête: $e');
  }
}


Future<void> sendAccidentReportDio(BuildContext context)  async {
  var dio = Dio();
  //-----------------------------Generate Token ---------------------------//
  print("+++++( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )++++ DEBUT  GENERATEUR DE TOKEN  pour test create ACCIDENT++++++++++++++++++++++");
  await TokenManager.getToken();
  print("+++++++++++++++++ END  GENERATEUR DE TOKEN  pour test create ACCIDENT++++++++++++++++++++++");
  //-----------------------------print Token In LOG -----------------------//

  print("------------( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )---------  print DEBUT REQUETTE CREATE ACCIDENT ------------");
  //--------------- Ajout du jeton d'authentification dans l'en-tête
  String? token = Constants.accessToken; // Remplacez par votre véritable jeton
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
  };

  dio.options.headers['Authorization'] = 'Bearer $token';

  Map<String, dynamic> data_reqAccident_json_all = context.read<ProviderColleteDataEnquete>().data_new_enquette ?? {};


  FormData formData = FormData.fromMap({
    "accidentReq": jsonEncode(data_reqAccident_json_all),
    // Ajoutez les images si nécessaire
    // "crashImage": await MultipartFile.fromFile('path_to_image', filename: 'image_name.png'),
  });

  try {
    var response = await dio.post(
      'http://51.195.11.202:8099/api/v1/accidents/',
      data: formData,
    );

    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print('-----------( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )-----La requête a échoué avec le statut: ${response.statusCode}.');
    }
  } catch (e) {
    print('---( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )----Une erreur est survenue lors de l\'envoi de la requête: $e');
  }
}
*/

