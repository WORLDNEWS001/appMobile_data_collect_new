import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/model/Class_setting/type_request_method.dart';
import 'package:secondtest/model/api_network_request/request_network_api.dart';

//-----------------------------  METHODE DE REQUETTE AVEC DIO TO TAKE ALL PATIENT EXIST---------------------------//

Future<Map<String, dynamic>?> RequestTakeAllPatient222(
    {required String? pathImageString}) async {
  var dio = Dio();
  //-----------------------------Generate Token ---------------------------//
  Logger().d("+++++( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )++++ DEBUT  GENERATEUR DE TOKEN  pour TAKE ALL PATIENT EXIST- ++++++++++++++++++++++");
  await TokenManager.getToken();
  print(
      "+++++++++++++++++ END  GENERATEUR DE TOKEN  pour TAKE ALL PATIENT EXIST ++++++++++++++++++++++");
  //-----------------------------print Token In LOG -----------------------//

  print("------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- DEBUT REQUETTE TAKE ALL PATIENT EXIST ------------");
  //--------------- Ajout du jeton d'authentification dans l'en-tête
  String? token = Constants.accessToken; // Remplacez par votre véritable jeton
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
  };

  if (pathImageString == null) {
    print("------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-- TAKE ALL PATIENT EXIST ---Le chemin de l'image est null");
    return null;
  }


  MultipartFile multipartFile = await MultipartFile.fromFile(pathImageString);

  var data = FormData.fromMap({
    'image': multipartFile,
  });

  try {
    //'${Constants.BASE_URL_API}/save-crash-image',
    var response = await dio.request(
      'http://51.195.11.202:8099/api/v1/accidents/save-crash-image',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      Logger().w(
          " -------------//++++++++++++//++++++++++  RESULT REQUETTE TAKE ALL PATIENT EXIST ---\n\n  ${response.data} \n\n");
      return response.data;
    } else {
      print(
          '-----------( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )-- TAKE ALL PATIENT EXIST ---La requête a échoué avec le statut: ${response.statusCode}.');
    }
  } catch (e) {
    print(
        '---( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )--TAKE ALL PATIENT EXIST --Une erreur est survenue lors de l\'envoi de la requête: $e');
  }

  Logger().e(
      "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- FIN REQUETTE TAKE ALL PATIENT EXIST  ------------");
}




Future<Map<String, dynamic>?> RequestTakeAllPatient({required BuildContext context,required String? dataSearch}) async {

  if(dataSearch == null){
    dataSearch = '';
  }

  RequestNetworkApi selectDataOmsRequest= RequestNetworkApi(
      context: context,
      EndPointUrl: "/cares/search",
      dataBodyJson: {
        'name': '$dataSearch',
      },
      Description: "Take All Patient Exist",
      typeResquestMethod: TypeResquestMethod.get,
      dataHeaderJson: {
        'lang': 'fr',
      }
  );

  Map<String, dynamic>? response = await selectDataOmsRequest.responseRequest();
  Map<String, dynamic>? allDataOmsSelect = response;

  Logger().w(" \n\n ------------ Take Data search patient  with String :: $dataSearch -------response is :: \n\n $allDataOmsSelect \n\n ");

  return allDataOmsSelect;


}

