import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';

//-----------------------------  METHODE DE REQUETTE AVEC DIO TO ADD IMAGE CRASH ---------------------------//

Future<Map<String, dynamic>?> AddImageCrashRequestDio(
    {required String? pathImageString}) async {
  var dio = Dio();
  //-----------------------------Generate Token ---------------------------//
  Logger().d(
      "+++++( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )++++ DEBUT  GENERATEUR DE TOKEN  pour ADD IMAGE CRASH ++++++++++++++++++++++");
  await TokenManager.getToken();
  print(
      "+++++++++++++++++ END  GENERATEUR DE TOKEN  pour ADD IMAGE CRASH ++++++++++++++++++++++");
  //-----------------------------print Token In LOG -----------------------//

  print(
      "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- DEBUT REQUETTE ADD IMAGE CRASH ------------");
  //--------------- Ajout du jeton d'authentification dans l'en-tête
  String? token = Constants.accessToken; // Remplacez par votre véritable jeton
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
  };

  if (pathImageString == null) {
    print(
        "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-- ADD IMAGE CRASH ---Le chemin de l'image est null");
    return null;
  }
  MultipartFile multipartFile = await MultipartFile.fromFile(pathImageString);

  var data = FormData.fromMap({
    // 'files': [
    //   await MultipartFile.fromFile(pathImageString, filename: '')
    // ],
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
          " -------------//++++++++++++//++++++++++  RESULT REQUETTE ADD IMAGE CRASH ---\n\n  ${response.data} \n\n");
      return response.data;
    } else {
      print(
          '-----------( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )-- ADD IMAGE CRASH ---La requête a échoué avec le statut: ${response.statusCode}.');
    }
  } catch (e) {
    print(
        '---( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )--ADD IMAGE CRASH --Une erreur est survenue lors de l\'envoi de la requête: $e');
  }

  Logger().e(
      "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- FIN REQUETTE ADD IMAGE CRASH  ------------");
}
