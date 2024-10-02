import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/model/Class_setting/json_file_manger.dart';
import 'package:secondtest/model/api_network_request/accident/list_accident_request.dart';
import 'package:secondtest/model/api_network_request/data_oms/data_select_oms_request.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
class DataListAccidentProvider with ChangeNotifier {


  //-------------------- Requette Obtention de la liste des Accident de la circulation-----
  List<Map<String, dynamic>?>? respDataAccidentListProvider = []; // Crée une liste dynamique vide

  List<Map<String, dynamic>?>? respDataAccidentListParGraviteProvider = []; // Crée une liste dynamique vide


  //-------------------- Etat De reponse API
  bool search_progress = false;

  //--------------------- Eroor Request List Accident
  bool errorRequestListAccident=false;

  int nbrEnqueteDataProvider = 0;




  UpdateDataAccidentListProvider({BuildContext? context}) async {


    Logger().i("--------(Provider)---------Appel Methode Requette List Accident  des donnee des Accidents En COur  ...--------------");
    search_progress = true;
    errorRequestListAccident=false;

    //notifyListeners();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });

    //------------- TEST CREATE ACCIDENT DART
    //await ListAccidentRequest(context: context).testCreateAccidentRequest();
    //------------- END TEST CREATE ACCIDENT DART

    //------------- TEST CREATE ACCIDENT DART
    //await ListAccidentRequest(context: context).testEditAccidentRequest();
    //------------- END TEST CREATE ACCIDENT DART







    await ListAccidentRequest(context: context).respDataAccidentListRequest().then((jsonData) async {



      // Suite d'instructions à exécuter après la réception des données
      if (jsonData == null || jsonData.isEmpty){
        // Lecture depuis le fichier JSON
        try{
          jsonData = await JsonFileManager.readFromJson(nameFileJson: "dataListEnquetteEnCour");
          print('Data read from JSON: $jsonData');
        }catch(e){

        }
      }else{
        // Écriture dans le fichier JSON
        await JsonFileManager.writeToJson(data: jsonData, nameFileJson: "dataListEnquetteEnCour");
      }




      //respDataAccidentListProvider =jsonData?['content'];
      respDataAccidentListProvider = (jsonData?['content'] as List<dynamic>).cast<Map<String, dynamic>>();
      nbrEnqueteDataProvider = jsonData?['totalElements'];

      // Créez une copie de la liste pour la trier
      respDataAccidentListParGraviteProvider = List.from(respDataAccidentListProvider ?? []);
      // Triez la liste principale en fonction de la gravité
      respDataAccidentListParGraviteProvider?.sort((a, b) {
        String severityA = a?["accidentSeverity"];
        String severityB = b?["accidentSeverity"];

        int getSeverityRank(String severity) {
          switch (severity) {
            case "Mortel":
              return 1;
            case "Traumatisme sérieux /grave":
              return 2;
            case "Traumatisme mineur/ léger":
              return 3;
            default:
              return 4;
          }
        }

        return getSeverityRank(severityA).compareTo(getSeverityRank(severityB));
      });



      if (jsonData ==null || jsonData.isEmpty){
        errorRequestListAccident=true;
      }else{
        errorRequestListAccident=false;
      }
        search_progress = false;

      Logger().i("--------(Provider)----------Fin de Mise a Jour des donnee des Accident --------------");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    });

    //await SelectDataOmsRequest().respSelectDataOmsRequest();
    //await DataOmsSelectProvider().UpdateDataOmsSelectProvider(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  updateStateErrorRequest(){
    errorRequestListAccident=true;
    print("****************************errorRequestListAccident == $errorRequestListAccident  ");
    notifyListeners();
  }


  RefreshProviderDataAccidentList(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

}