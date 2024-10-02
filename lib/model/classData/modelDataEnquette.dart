
/*
import 'package:flutter/cupertino.dart';

class TestlistdataSelectModel {
  String value;
  String label;

  TestlistdataSelectModel({
    required this.value,
    required this.label,
  });
}





class AccidentSeverityResp {
  int id;
  String code;
  String value;
  String? description;

  AccidentSeverityResp({
    required this.id,
    required this.code,
    required this.value,
    this.description,
  });
}

class AccidentTypeResp {
  int id;
  int code;
  String value;

  AccidentTypeResp({
    required this.id,
    required this.code,
    required this.value,
  });
}

class ActionResp {
  int id;
  int code;
  String value;

  ActionResp({
    required this.id,
    required this.code,
    required this.value,
  });
}

class ModelData {
  List<AccidentSeverityResp> accidentSeverityRespList;
  List<AccidentTypeResp> accidentTypeRespList;
  List<ActionResp> actionRespList;

  ModelData({
    required this.accidentSeverityRespList,
    required this.accidentTypeRespList,
    required this.actionRespList,
  });
}





class testdata{

  static void exec() {

    print("-----------------------  execute data in model data enquette-----------");

      Map<String, dynamic> jsonData = {
        "data": {
          "accidentSeverityResp": [
            {
              "id": 1,
              "code": "1",
              "value": "Mortel",
              "description": null
            },
            {
              "id": 2,
              "code": "2",
              "value": "Traumatisme sérieux /grave",
              "description": null
            },
            {
              "id": 3,
              "code": "3",
              "value": "Traumatisme mineur/ léger",
              "description": null
            }
          ],
          "accidentTypeResp": [
            {
              "id": 1,
              "code": 1,
              "value": "Accident avec piéton"
            },
            {
              "id": 2,
              "code": 1,
              "value": "Accident avec piéton"
            },
            {
              "id": 3,
              "code": 2,
              "value": "Accident avec un véhicule stationné"
            },
            {
              "id": 4,
              "code": 3,
              "value": "Accident avec un obstacle fixe"
            },
            {
              "id": 5,
              "code": 4,
              "value": "Obstacle non fixe"
            },
            {
              "id": 6,
              "code": 5,
              "value": "Animal"
            },
            {
              "id": 7,
              "code": 6,
              "value": " Accident impliquant un seul véhicule/pas de collision "
            },
            {
              "id": 8,
              "code": 7,
              "value": "Accident impliquant deux véhicules ou plus"
            },
            {
              "id": 9,
              "code": 8,
              "value": "Autres accidents"
            }
          ],
          "actionResp": [
            {
              "id": 1,
              "code": 1,
              "value": "Traversait"
            },
            {
              "id": 2,
              "code": 2,
              "value": "Marchait sur la chaussée"
            },
            {
              "id": 3,
              "code": 3,
              "value": "Se tenait sur la chaussée"
            },
            {
              "id": 4,
              "code": 4,
              "value": "Pas sur la chaussée"
            },
            {
              "id": 5,
              "code": 8,
              "value": "Autre",
            },
            {
              "id": 6,
              "code": 9,
              "value": "Inconnu"
            }
          ]
        }
      };

      //Map<String, dynamic> modif_data = jsonData.putIfAbsent(key, () => null);

      print("i print Json Data ------------------- $jsonData");

      List<AccidentSeverityResp> accidentSeverityRespList = [];
      List<dynamic> accidentSeverityRespData = jsonData['data']['accidentSeverityResp'];
      for (var item in accidentSeverityRespData) {
        accidentSeverityRespList.add(AccidentSeverityResp(
          id: item['id'],
          code: item['code'],
          value: item['value'],
          description: item['description'],
        ));
      }



    print("-------------------/////////////////////////////////  DATA SELECT CREATED -----------");






    // ---------------item Virage
    final List<TestlistdataSelectModel> _item_Virage = [];

    for (var item in accidentSeverityRespData) {
      _item_Virage.add(TestlistdataSelectModel(
        value: item['value'],
        label: item['description'],
      ));
    //  print(item);
    }
    // List<String> NewListData = _item_Virage.map((e) =>  (e.value.toString())).toList();
   // print (NewListData);
    _item_Virage.forEach((element) {
      print (element.value);
    });



    print("-------------------/////////////////////////////////  _item_Virage   END DATA SELECT CREATED ////////////////////-----------");

    print("----------------------------------------------------- END DATA SELECT CREATED ////////////////////-----------");


    List<AccidentTypeResp> accidentTypeRespList = [];
      List<dynamic> accidentTypeRespData = jsonData['data']['accidentTypeResp'];
      for (var item in accidentTypeRespData) {
        accidentTypeRespList.add(AccidentTypeResp(
          id: item['id'],
          code: item['code'],
          value: item['value'],
        ));
      }

      List<ActionResp> actionRespList = [];
      List<dynamic> actionRespData = jsonData['data']['actionResp'];
      for (var item in actionRespData) {
        actionRespList.add(ActionResp(
          id: item['id'],
          code: item['code'],
          value: item['value'],
        ));
      }

      ModelData modelData = ModelData(
        accidentSeverityRespList: accidentSeverityRespList,
        accidentTypeRespList: accidentTypeRespList,
        actionRespList: actionRespList,
      );

    print("-----------------------------------------------------TEST print MODEL DATA----- ////////////////////-----------");

      print(modelData.accidentSeverityRespList[0].value);
      print(modelData.accidentTypeRespList[1].value);
      print(modelData.actionRespList[0].value);
    print("----------------------------------------------------- END print DATA SELECT CREATED ////////////////////-----------");


    // Utilisation de la structure de données
    print('Accident Severity Response:');
    modelData.accidentSeverityRespList.forEach((resp) {
      print('id: ${resp.id}, code: ${resp.code}, value: ${resp.value}, description: ${resp.description}');
    });

    print('\nAccident Type Response:');
    modelData.accidentTypeRespList.forEach((resp) {
      print('id: ${resp.id}, code: ${resp.code}, value: ${resp.value}');
    });

    print('\nAction Response:');
    modelData.actionRespList.forEach((resp) {
      print('id: ${resp.id}, code: ${resp.code}, value: ${resp.value}');
    });

      print("-----------------------  execute data in model data enquette-----------");
  }

}
*/