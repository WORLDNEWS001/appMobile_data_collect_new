


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/model/Class_setting/type_request_method.dart';
import 'package:http/http.dart' as http;
import 'package:secondtest/model/provider/list_accident_provider/data_list_accident_provider.dart';

class RequestNetworkApi {

  BuildContext? context;

  String EndPointUrl;
  Map<String, dynamic> dataBodyJson;
  Map<String, String>? dataHeaderJson ;
  String Description;
  TypeResquestMethod typeResquestMethod;

  RequestNetworkApi({
     this.context,
    required this.EndPointUrl,
    this.dataHeaderJson,
    required this.dataBodyJson,
    required this.Description,
    required this.typeResquestMethod
});



    Future<dynamic>  responseRequest() async{

      var response;

      try {



        //-------------- URL de l'API et paramètres de la requête
        String url = '${Constants.BASE_URL_API}${EndPointUrl}';

        //-----------------------------Generate Token ---------------------------//
        await TokenManager.getToken();
        //-----------------------------print Token In LOG -----------------------//

        print("/------(REQUEST $Description)------ Debut execution Section Class Request API Method ------------------");

        //--------------- Ajout du jeton d'authentification dans l'en-tête
        String? token = Constants.accessToken; // Remplacez par votre véritable jeton
        Map<String, String> headers = {
          'Authorization': 'Bearer $token',
        };



        // Assurez-vous que dataHeaderJson n'est pas null avant d'ajouter
        if (dataHeaderJson == null) {
          dataHeaderJson = {};
        }
        dataHeaderJson!.addAll(headers);

        switch (typeResquestMethod){
          case TypeResquestMethod.post : {
            logger.i("/-------------(REQUEST)--------------Execution Request API URL : $url , **** Avec Data : $dataBodyJson------------------");

            response = await http.post(
              Uri.parse(url),
              headers: dataHeaderJson,
              body: jsonEncode(dataBodyJson), // Convertissez les données en format JSON
            );

          }
          break;
          case TypeResquestMethod.get : {

            //--------------- Construction de l'URL complète avec les paramètres de requête
            String queryString = Uri(queryParameters: dataBodyJson).query;
            String requestUrl = '$url?$queryString';

            //---------------- Envoi de la requête GET avec l'en-tête d'authentification
            logger.i("/-------------(REQUEST $Description)--Methode ($typeResquestMethod)--------------Execution Request API URL : $requestUrl------------------");
             response = await http.get(Uri.parse(requestUrl), headers: dataHeaderJson);

          }
          break;
          default:
            Logger().e("***************** Error Request in Switth Case");

        }


        if (response.statusCode == 200) {
          //-------------- Traitement de la réponse
          String responseBody = response.body;
          //print('Réponse Body Api data Accident string is: $responseBody');

          //--------------- Conversion du JSON en une variable de type Map<String, dynamic>
          Map<String, dynamic> jsonDataResult = jsonDecode(utf8.decode(responseBody.codeUnits));

          print("*************************** result-------------- $jsonDataResult");

          return jsonDataResult;
        }
        else {
          print("++++++++++++++++ Error Request ------------  ${response.statusCode}");
          logger.i("/--------ERRORR ${response.statusCode} REQUETTE--($Description)---- END POINT URL : ' $url ' -- HEADER : '$dataHeaderJson '--Debut Execution Request API Method --------------------");

        }


        logger.i("/-----------(Requette : ($Description))---End Section Class Request API ------------------");

      } catch (e) {
        // Gérer les erreurs ici
        print('Erreur de connexion fontion $Description ===>> : $e');
        //DataListAccidentProvider().updateStateErrorRequest();
        //context?.read<DataListAccidentProvider>().updateStateErrorRequest();
      }


    }





}
