

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/VariableData.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/providerUtils.dart';
import 'dart:math';


class GlobalMethod{





  String generateUniqueIdStrint() {
    var now = DateTime.now();
    return '${now.millisecondsSinceEpoch}';
  }

  int generateUniqueIdInt() {
    var now = DateTime.now();
    var uniqueId = int.parse('${now.millisecondsSinceEpoch}');
    return uniqueId;
  }



  static String convertirDateFrancais(String? dateStr) {
    // Vérifier le format de la date d'entrée (optionnel)
	// Vérifier le format de la date d'entrée (optionnel)
    // ...

    // Convertir la chaîne de caractères en un objet DateTime
    if(dateStr == null || dateStr.isEmpty || dateStr == ""){
      dateStr = "2024-03-19";
      return "19/03/2024";
    }else{

    //-- verifir si la date est de la forme dd/mm/yyyy
    if(dateStr != null && dateStr.contains("/")){
      return dateStr;
    }else{

        DateTime date = DateTime.parse(dateStr);

        // Formater la date selon le format français (jj/mm/aaaa)
        DateFormat formatter = DateFormat('dd/MM/yyyy');
        String formattedDate = formatter.format(date);

        return formattedDate;
      }
    }
  }

  //------------- methode qui prend en parametre un String et la methode verifie si ce string est un lien URL , si c'est un lien URL il retourne True, si ce n'est pas le cas , c'est false
  static bool isURL_old(String? str) {
    if (str == null) {
      return false;
    }
    return Uri.tryParse(str)?.hasAbsolutePath ?? false;
  }

  static bool isURL(String? str) {
    if (str == null) {
      return false;
    }
    Uri? uri = Uri.tryParse(str);
    // Vérifiez si le schéma est 'http' ou 'https'
    return (uri?.scheme == 'http' || uri?.scheme == 'https');
  }

  //----------- je veux une methode qui verifici qi le smarthphone a acces internet ou pas , si il a acces a internet il retourne true , sinon il retourne false , en tenant compte du fait que les donnee mobiles peuvent etre activer mais pas d'acces a internet , aussi que le telephone peut etre connecter a un wifi mais pas d'acces a internet
  static Future<void> listenToInternetConnection(BuildContext context) async {
    print(
        "\n\n ********  Je teste la connexion internet---\n --- la valeur variable isConnect est : $isConnected \n\n");

    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        print("l'appareille s'est deconnecter de internet");

        try {
          final response = await http.get(Uri.parse('https://www.google.com'));
          //--attente de 2 milisecondes
          await Future.delayed(Duration(milliseconds: 5));
          if (response.statusCode == 200) {
            print("acces a internet (REQUETTE GOOGLE REUSSI) ");
            context.read<ProviderUtils>().UpdateOnConnection(true);
            //return true;
          } else {
            print("l'appareille s'est deconnecter de internet");
            context.read<ProviderUtils>().UpdateOnConnection(false);
            //return false;

            //------------- Essayer de se connecter a internet une deuxieme fois

            try {
              final response =
                  await http.get(Uri.parse('https://www.google.com'));
              //--attente de 2 milisecondes
              await Future.delayed(Duration(milliseconds: 5));
              if (response.statusCode == 200) {
                print(
                    "acces a internet (REQUETTE GOOGLE REUSSI) ---Essaie une deuxieme fois ");
                context.read<ProviderUtils>().UpdateOnConnection(true);
                //return true;
              } else {
                print("l'appareille s'est deconnecter de internet");
                context.read<ProviderUtils>().UpdateOnConnection(false);
                //return false;
              }
            } catch (e) {
              print("l'appareille s'est deconnecter de internet");
              context.read<ProviderUtils>().UpdateOnConnection(false);
              //return false;
            }

            //----------------- fin de la deuxieme tentative de connexion a internet
          }
        } catch (e) {
          print("l'appareille s'est deconnecter de internet");
          context.read<ProviderUtils>().UpdateOnConnection(false);
          //return false;

          //------------- Essayer de se connecter a internet une deuxieme fois

          try {
            final response =
                await http.get(Uri.parse('https://www.google.com'));
            //--attente de 2 milisecondes
            await Future.delayed(Duration(milliseconds: 5));

            if (response.statusCode == 200) {
              print(
                  "acces a internet (REQUETTE GOOGLE REUSSI) ---Essaie une deuxieme fois");
              context.read<ProviderUtils>().UpdateOnConnection(true);
              //return true;
            } else {
              print("l'appareille s'est deconnecter de internet");
              context.read<ProviderUtils>().UpdateOnConnection(false);
              //return false;
            }
          } catch (e) {
            print("l'appareille s'est deconnecter de internet");
            context.read<ProviderUtils>().UpdateOnConnection(false);
            //return false;
          }

          //----------------- fin de la deuxieme tentative de connexion a internet
        }
      } else {
        // Check if there is actual internet connection
        try {
          final response = await http.get(Uri.parse('https://www.google.com'));
          //--attente de 2 milisecondes
          await Future.delayed(Duration(milliseconds: 5));
          if (response.statusCode == 200) {
            print("acces a internet (REQUETTE GOOGLE REUSSI) ");
            context.read<ProviderUtils>().UpdateOnConnection(true);
            //return true;
          } else {
            print("l'appareille s'est deconnecter de internet");
            context.read<ProviderUtils>().UpdateOnConnection(false);
            //return false;

            //------------- Essayer de se connecter a internet une deuxieme fois

            try {
              final response =
                  await http.get(Uri.parse('https://www.google.com'));
              //--attente de 2 milisecondes
              await Future.delayed(Duration(milliseconds: 5));
              if (response.statusCode == 200) {
                print("acces a internet (REQUETTE GOOGLE REUSSI) ");
                context.read<ProviderUtils>().UpdateOnConnection(true);
                //return true;
              } else {
                print("l'appareille s'est deconnecter de internet");
                context.read<ProviderUtils>().UpdateOnConnection(false);
                //return false;
              }
            } catch (e) {
              print("l'appareille s'est deconnecter de internet");
              context.read<ProviderUtils>().UpdateOnConnection(false);
              //return false;
            }

            //----------------- fin de la deuxieme tentative de connexion a internet
          }
        } catch (e) {
          print("l'appareille s'est deconnecter de internet");
          context.read<ProviderUtils>().UpdateOnConnection(false);
          //return false;

          //------------- Essayer de se connecter a internet une deuxieme fois

          try {
            final response =
                await http.get(Uri.parse('https://www.google.com'));
            //--attente de 2 milisecondes
            await Future.delayed(Duration(milliseconds: 5));
            if (response.statusCode == 200) {
              print(
                  "acces a internet (REQUETTE GOOGLE REUSSI) ---Essaie une deuxieme fois");
              context.read<ProviderUtils>().UpdateOnConnection(true);
              //return true;
            } else {
              print("l'appareille s'est deconnecter de internet");
              context.read<ProviderUtils>().UpdateOnConnection(false);
              //return false;
            }
          } catch (e) {
            print("l'appareille s'est deconnecter de internet");
            context.read<ProviderUtils>().UpdateOnConnection(false);
            //return false;
          }

          //----------------- fin de la deuxieme tentative de connexion a internet
        }
      }

      print(
          "\n\n ********  Je teste la connexion internet---\n --- la nouvelle actuelle valeur variable isConnect est : $isConnected \n\n");
    });
  }






  static MaterialColor getSeverityColor(String severity) {
    switch (severity) {
      case "Mortel":
        return Colors.red;
      case "Traumatisme sérieux /grave":
        return Colors.orange;
      case "Traumatisme mineur/ léger":
        return Colors.green;
      default:
        return Colors.grey; // Par défaut, retourne une couleur neutre si la gravité n'est pas reconnue
    }
  }


  static List<Widget> getSeverityWidgets(String severity) {
    List<Widget> widgets = [];
    String pathIconSeverity ="assets/icon_doser/severity_icon.png";
    double withIcon = 20;

    switch (severity) {
      case "Mortel":
        widgets = [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(pathIconSeverity, width: withIcon),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(pathIconSeverity, width: withIcon),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(pathIconSeverity, width: withIcon),
          ),

        ];
        break;
      case "Traumatisme sérieux /grave":
        widgets = [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(pathIconSeverity, width: withIcon),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(pathIconSeverity, width: withIcon),
          ),
        ];
        break;
      case "Traumatisme mineur/ léger":
        widgets = [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(pathIconSeverity, width: withIcon),
          ),
        ];
        break;
      default:
        widgets = [

          Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(Icons.error, color: Colors.grey)
          ),
        ];
        break;
    }

    return widgets;
  }





  static ImageProvider getImageProvider(String path) {
    print("\n\n\n\n path du croquis a Afficher: $path \n\n\n\n ");
    if (path.startsWith('http') || GlobalMethod.isURL(path)) {
      if(isConnected==true ){
        return CachedNetworkImageProvider(path);
      }else{
        //-- retunr image asset
        return AssetImage('assets/icon_doser/no_internet.png');
      }

    } else {
      return FileImage(File(path));
    }
  }

  static Widget getImageInContainer(String? path) {
    print("\n\n\n\n path du croquis a Afficher: $path \n\n\n\n ");
    if(path == null || path.isEmpty) {
      return Container(
        child: Image.asset("assets/icon_doser/no_internet.png", fit: BoxFit.cover),
      );
    }else{

      if (path.startsWith('http') || GlobalMethod.isURL(path)) {
        if(isConnected==true ){
          return Container(
            child:Image.network(
              "$path.png",
              fit: BoxFit.cover, // Ajustez l'image selon vos besoins (cover, contain, etc.)
            ),
          );
        }else{
          //-- retunr image asset
          return Container(
            child:Image.asset(
              "assets/icon_doser/no_internet.png",
              fit: BoxFit.cover, // Ajustez l'image selon vos besoins (cover, contain, etc.)
            ),
          );
        }
      }
      else {
        return Container(
          child: Image.file(File(path), fit: BoxFit.cover),
        );
      }

    }

  }




}