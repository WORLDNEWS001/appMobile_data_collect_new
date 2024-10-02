import 'dart:convert';

import 'package:secondtest/authentificator/request_Token.dart';
import 'package:http/http.dart' as http;
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/ressource/saveDataJson.dart';

import 'package:secondtest/model/classData/testBrouillon/testdata.dart';

class RequestAPIScript {



  Future<List<dynamic>> RespDataAccident() async {
    print(
        "/--------------------------- Debut execution Section Class Request API Method Get Data Accident------------------");
    logger.i(
        "/--------------------------- Debut Execution Section Class Request API Method Get Data Accident------------------");

    // Création d'une variable Map<String, dynamic> vide
    Map<String, dynamic> myMapDataOms = {};

    // URL de l'API et paramètres de la requête
    String url = '${Constants.BASE_URL_API}/accidents';
    Map<String, String> queryParams = {
      'page': '0',
      'size': '20',
      'search': '',
    };

    // Ajout du jeton d'authentification dans l'en-tête
    String? token = Constants.accessToken; // Remplacez par votre véritable jeton
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    // Construction de l'URL complète avec les paramètres de requête
    String queryString = Uri(queryParameters: queryParams).query;
    String requestUrl = '$url?$queryString';

    // Envoi de la requête GET avec l'en-tête d'authentification
    http.Response response = await http.get(
        Uri.parse(requestUrl), headers: headers);

    // Vérification du code de statut de la réponse
    if (response.statusCode == 200) {
      // Traitement de la réponse
      String responseBody = response.body;
      print('Réponse Body Api data Accident string is: $responseBody');
      //print('Réponse ALL COMPLET Api data Accident string is: ${response.body}');
      // Conversion du JSON en une variable de type Map<String, dynamic>
      Map<String, dynamic> jsonData = jsonDecode(utf8.decode(responseBody.codeUnits));

      List<dynamic> respDataAccident = jsonData['data']['content'] ?? [];

      return respDataAccident;


      // Affichage d'un exemple d'accès aux données
      print('Accident data:');
      for (var item in respDataAccident) {
        print('ID----: ${item['id']}, Code: ${item['code']}, city: ${item['city']} , place: ${item['place']} , crashDate: ${item['crashDate']} , crashTime: ${item['crashTime']}');
      }

    } else {
      // Affichage du message d'erreur en cas d'échec de la requête
      print('Erreur de requête : ${response.statusCode}');
    }

    print(
        "/---------------------------End Section Class Request API Method Get Data Accident------------------");
    logger.i(
        "/---------------------------End Section Class Request API Method Get Data Accident------------------");

    return [];
  }


  Future<void> getTokensave() async {
    print("----------Token bearer est ${Constants.accessToken}");
  }


  Future<List<dynamic>> RespDataOmsForm() async {


    print("/---------------------------Debut execution Section Class Request API Method Get Data OMS FORM------------------");
    logger.i("/---------------------------Debut Execution Section Class Request API Method Get Data OMS FORM------------------");

    // URL de l'API
    String url = '${Constants.BASE_URL_API}/accidents/oms-data';


    // Ajout du jeton d'authentification dans l'en-tête
    String? token = Constants.accessToken; // Remplacez par votre véritable jeton
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'lang': 'fr',
    };

    // Envoi de la requête GET avec l'en-tête d'authentification
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    // Vérification du code de statut de la réponse
    if (response.statusCode == 200) {

      List<dynamic> myListresult = [];


      // Traitement de la réponse
      String responseBody = response.body;
      print('Réponse : $responseBody');

      print(' conversion JSON ');
      //Map<String, dynamic> jsonResponsedata_decode = jsonDecode(utf8.decode(responseBody.codeUnits));
      //List<dynamic> jsonResponsedata = jsonResponsedata_decode['data'];

      Map<String, dynamic> jsonData = jsonDecode(utf8.decode(responseBody.codeUnits));

      print(jsonData['data']);

      myListresult.addAll(jsonData['data']['accidentSeverityResp']);



      //List<dynamic> respDataoms = jsonData[0]['data'] ?? [];
      List<dynamic> respDataoms = jsonData.values.toList();
      
      print("-----------------------------");

      List<dynamic> respDataomse = respDataoms;


      //print(respDataomse);

      //return respDataoms;
      return myListresult;



      /*
      print(' conversion JSON ----------- Declaration du fichier ----------');
      JsonFileManager jsonManagerDataAccident = JsonFileManager('DataOmsFormJson.json');

      print(' conversion JSON ----------- creation du fichier DataOmsFormJson.json ');
      jsonManagerDataAccident.createFileDataJson();

      print(' conversion JSON ----------- Saved and Merge Data in DataOmsFormJson.json ');
      jsonManagerDataAccident.addData(jsonResponsedatao);
      */


      /*
      print(' ***********  Debut Try----- ');
      try {
        // Convertir la réponse en un objet JSON
        Map<String, dynamic> jsonData = jsonDecode(responseBody);



        // Vérifier si les données sont présentes dans la réponse
        if (jsonData.containsKey('data')) {
          // Récupérer les données
          Map<String, dynamic> data = jsonData['data'];

          // Vérifier si toutes les données nécessaires sont présentes
          if (data.containsKey('accidentSeverityResp') &&
              data.containsKey('accidentTypeResp') &&
              data.containsKey('actionResp') &&
              data.containsKey('brandResp')) {
            // Toutes les données sont présentes, vous pouvez les traiter maintenant

            List<dynamic> accidentSeverityResp = data['accidentSeverityResp'];
            List<dynamic> accidentTypeResp = data['accidentTypeResp'];
            List<dynamic> actionResp = data['actionResp'];
            List<dynamic> brandResp = data['brandResp'];

            // Effectuer le traitement sur les données
            // Affichage d'un exemple d'accès aux données
            print('Accident Severity Resp:');
            for (var item in accidentSeverityResp) {
              print('ID: ${item['id']}, Code: ${item['code']}, Value: ${item['value']}');
            }
            // ...

          } else {
            print('Données manquantes dans la réponse JSON');
          }
        } else {
          print('Clé "data" manquante dans la réponse JSON');
        }
      } catch (e) {
        print('Erreur lors de la conversion JSON : $e');
      }



    } else {
      // Affichage du message d'erreur en cas d'échec de la requête
      print('Erreur de requête : ${response.statusCode}');
    }

    */


    }else{

      List<dynamic> jsonSmsErrorRequest = [
        {
          'statusCode': response.statusCode,
          'response': response,
        }
      ];

      return jsonSmsErrorRequest;





    }
    print("---------------------------End Section Class Request API Method Get Data OMS FORM------------------");
    logger.i("---------------------------End Section Class Request API Method Get Data OMS FORM------------------");


  }




  /*
  static Future<void> getDataAccident() async {
    print(
        "/--------------------------- Debut execution Section Class Request API Method Get Data Accident------------------");
    logger.i(
        "/--------------------------- Debut Execution Section Class Request API Method Get Data Accident------------------");

    // Création d'une variable Map<String, dynamic> vide
    Map<String, dynamic> myMapDataOms = {};

    // URL de l'API et paramètres de la requête
    String url = 'http://141.95.103.210:8099/api/v1/accidents';
    Map<String, String> queryParams = {
      'page': '0',
      'size': '10',
      'search': '',
    };

    // Ajout du jeton d'authentification dans l'en-tête
    String? token = Constants
        .accessToken; // Remplacez par votre véritable jeton
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    // Construction de l'URL complète avec les paramètres de requête
    String queryString = Uri(queryParameters: queryParams).query;
    String requestUrl = '$url?$queryString';

    // Envoi de la requête GET avec l'en-tête d'authentification
    http.Response response = await http.get(
        Uri.parse(requestUrl), headers: headers);

    // Vérification du code de statut de la réponse
    if (response.statusCode == 200) {
      // Traitement de la réponse
      String responseBody = response.body;
      //print('Réponse Body Api data oms string is: $responseBody');
      print('Réponse ALL COMPLET Api data oms string is: ${response.body}');

      /*--------------------------------------------
                // Vérification du contenu de la réponse JSON
                      print(responseBody);

                // Conversion du JSON en une variable de type Map<String, dynamic>
                      Map<String, dynamic> jsonData = jsonDecode(responseBody);

                // Accès aux données dans la variable jsonData
                      List<dynamic> accidentSeverityResp = jsonData['data']['accidentSeverityResp'] ?? [];
                      List<dynamic> accidentTypeResp = jsonData['data']['accidentTypeResp'] ?? [];
                      List<dynamic> actionResp = jsonData['data']['actionResp'] ?? [];
                      List<dynamic> brandResp = jsonData['data']['brandResp'] ?? [];

                // Affichage d'un exemple d'accès aux données
                      print('Accident Severity Resp:');
                      for (var item in accidentSeverityResp) {
                        print('ID: ${item['id']}, Code: ${item['code']}, Value: ${item['value']}');
                      }
      ------------------------------------------------------------*/


      /*----------------------------------------------------------*/


      /*------------------------------------------------ */


      // Conversion de la réponse JSON en Map<String, dynamic>
      //Map<String, dynamic> RespJsonDataOms = response.body as Map<String, dynamic>;

      // Conversion de la réponse JSON en Map<String, dynamic>
      //Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
      // Ajout ou fusion des données JSON dans la variable myMap
      //myMapDataOms.addAll(jsonResponse);

      /*
      JsonFileManager jsonManagerDataAccident = JsonFileManager('DataAccidentJson.json');

      jsonManagerDataAccident.createFileDataJson();

      jsonManagerDataAccident.addData(myMapDataOms);


       */


      //save data in file JSON in memory phone
    } else {
      // Affichage du message d'erreur en cas d'échec de la requête
      print('Erreur de requête : ${response.statusCode}');
    }

    print(
        "/---------------------------End Section Class Request API Method Get Data Accident------------------");
    logger.i(
        "/---------------------------End Section Class Request API Method Get Data Accident------------------");
  }
  */





}