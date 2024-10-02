import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/model/other_class_object/deposition_model.dart';

//-----------------------------  METHODE DE REQUETTE AVEC DIO TO SAVE ALL DEPOSITION  >> $id_enquette << ---------------------------//

Future<Map<String, dynamic>?> RequestSaveAllDeposition(
    {required int? id_enquette, List<Deposition?>? listDepositionSend}) async {
  var dio = Dio();
  //-----------------------------Generate Token ---------------------------//
  Logger().d(
      "+++++( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )++++ DEBUT  GENERATEUR DE TOKEN  pour SAVE ALL DEPOSITION  >> $id_enquette << ++++++++++++++++++++++");
  await TokenManager.getToken();
  print(
      "+++++++++++++++++ END  GENERATEUR DE TOKEN  pour SAVE ALL DEPOSITION  >> $id_enquette << ++++++++++++++++++++++");
  //-----------------------------print Token In LOG -----------------------//

  print(
      "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- DEBUT REQUETTE SAVE ALL DEPOSITION  >> $id_enquette << ------------");
  //--------------- Ajout du jeton d'authentification dans l'en-tête
  String? token = Constants.accessToken; // Remplacez par votre véritable jeton

  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
  };

  //-- Convert List Deposition to List Map for send to API
  List<Map<String, dynamic>?>? listDepositionMap = listDepositionSend?.map((e) => e?.toJson_send_api()).toList();

  //dio.options.headers['Authorization'] = 'Bearer $token';
  /*
  Map<String, dynamic> dataSend = {
    "id": id_enquette,
    "dec":1,
  };
   */

  FormData formData = FormData.fromMap({
    "deposDTO": jsonEncode(listDepositionMap),
  });



  try {

    var response = await dio.request('${Constants.BASE_URL_API}/accidents/deposition-add',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: formData,
    );


    if (response.statusCode == 200) {
      Logger().w(
          " -------------//++++++++++++//++++++++++  RESULT REQUETTE SAVE ALL DEPOSITION  >> $id_enquette << ---\n\n  ${response.data} \n\n");
      return response.data;
    } else {
      print(
          '-----------( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )-- SAVE ALL DEPOSITION  >> $id_enquette << ---La requête a échoué avec le statut: ${response.statusCode}.');
    }
  } catch (e) {
    print(
        '---( UTILISATION DE LA METHODE DIO POUR LES REQUETTE )--SAVE ALL DEPOSITION  >> $id_enquette << --Une erreur est survenue lors de l\'envoi de la requête: $e');
  }

  Logger().e(
      "------------( UTILISATION DE LA METHODE DIO POUR REQUETTE )-------- FIN REQUETTE SAVE ALL DEPOSITION  >> $id_enquette <<  ------------");
}
