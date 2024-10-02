import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:secondtest/GlobalConstantData.dart';

final Logger logger = Logger();

class TokenManager {



  static Future<void> getToken() async {

    logger.i("******( REQUEST TOKEN )*****SECTION ------------   Demande Acces Token---------");



    // URL de l'endpoint pour obtenir le jeton d'accès
    String tokenUrl = Constants.URL_KEYCLOACK_REALM_CONFIG;



    // Données requises pour demander le jeton d'accès
    Map<String, String> data = {
      "grant_type": Constants.grantType,
      "client_id": Constants.clientId,
      "client_secret": Constants.clientSecret,
      "username": Constants.username,
      "password": Constants.password,
    };


    // Envoi de la requête POST pour obtenir le jeton d'accès
    http.Response response = await http.post(Uri.parse(tokenUrl), body: data);

    // Vérification du code de statut de la réponse
    if (response.statusCode == 200) {
      // Traitement de la réponse JSON
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String accessToken = jsonResponse['access_token'];
      Constants.accessToken= accessToken;
      //print(accessToken);
      logger.d('-----------Connecter user access token ${accessToken}');
    } else {
      // Affichage du message d'erreur en cas d'échec de la requête
      print('Erreur de requête : ${response.statusCode}');
      Constants.accessToken= 'null';
    }


    logger.i("###########--- END---------Section ------------   Demande Acces Token---------");
  }



}
