import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';

//-----------------------------  METHODE DE REQUETTE AVEC DIO TO SAVE DRAWING IN NETWORK ---------------------------//

Future<Map<String, dynamic>?> RequestSendDrawingCroquis(
    {required String? pathImageString, required int id_enquette}) async {
  var dio = Dio();
  //-----------------------------Generate Token ---------------------------//
  Logger().d(
      "+++++( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )++++ DEBUT  GENERATEUR DE TOKEN  pour SAVE DRAWING IN NETWORK ++++++++++++++++++++++");
  await TokenManager.getToken();
  print(
      "+++++++++++++++++ END  GENERATEUR DE TOKEN  pour SAVE DRAWING IN NETWORK ++++++++++++++++++++++");
  //-----------------------------print Token In LOG -----------------------//

  print(
      "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- DEBUT REQUETTE SAVE DRAWING IN NETWORK ------------");
  //--------------- Ajout du jeton d'authentification dans l'en-tête
  String? token = Constants.accessToken; // Remplacez par votre véritable jeton
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
  };

  if (pathImageString == null) {
    print(
        "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-- SAVE DRAWING IN NETWORK ---Le chemin de l'image est null");
    return null;
  }
  MultipartFile multipartFile = await MultipartFile.fromFile(pathImageString);

  var data = FormData.fromMap({
    // 'files': [
    //   await MultipartFile.fromFile(pathImageString, filename: '')
    // ],
    'image': multipartFile,
    'accident_id': id_enquette,
  });

  try {
    //'${Constants.BASE_URL_API}/save-crash-image',
    var response = await dio.request('${Constants.BASE_URL_API}/accidents/save-drawing',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      Logger().w(
          " -------------//++++++++++++//++++++++++  RESULT REQUETTE SAVE DRAWING IN NETWORK ---\n\n  ${response.data} \n\n");
      return response.data;
    } else {
      print(
          '-----------( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )-- SAVE DRAWING IN NETWORK ---La requête a échoué avec le statut: ${response.statusCode}.');
    }
  } catch (e) {
    print(
        '---( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )--SAVE DRAWING IN NETWORK --Une erreur est survenue lors de l\'envoi de la requête: $e');
  }

  Logger().e(
      "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- FIN REQUETTE SAVE DRAWING IN NETWORK  ------------");
}
