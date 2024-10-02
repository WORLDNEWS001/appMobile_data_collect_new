import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Liste_Accident/Tile_One_Accident/Profil_Image_Accident.dart';

import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/authentificator/requestAPI.dart';
import 'package:http/http.dart' as http;
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/controller/ControllerEnquette/ControllerEnquette.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/Class_setting/List_accident_load_service/Option_accident.dart';
import 'package:secondtest/model/api_network_request/accident/list_accident_request.dart';
import 'dart:convert';

import 'package:secondtest/model/classData/testBrouillon/testdata.dart';
import 'package:secondtest/model/provider/list_accident_provider/data_list_accident_provider.dart';
import 'package:secondtest/widgets/general_widget/previewImage/ImagePreviewDialog.dart';

import '../../model/provider/list_accident_provider/option_accident/type_option_provider.dart';

class enqueteEnCour extends StatefulWidget {
  const enqueteEnCour({Key? key}) : super(key: key);

  String TextTitle(){
    return "Liste Enquête(e)";
  }

  @override
  State<enqueteEnCour> createState() => _enqueteEnCourState();


}

class _enqueteEnCourState extends State<enqueteEnCour> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // context.read<DataListAccidentProvider>().UpdateDataAccidentListProvider();
    Logger().e("***************** // INIT STATE PAGE enqueteEnCour // *****************");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //------------------- Debut Good ------------------------//

    if (context.watch<DataListAccidentProvider>().search_progress) {
      // Si la liste est vide, afficher un widget de chargement
      if(context.watch<DataListAccidentProvider>().errorRequestListAccident){
        return Center(
          child: Text("Actualisez La Page...",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.redAccent
            ),
          ),
        );
      }else{
        return Center(
          child:  CircularProgressIndicator(
            strokeWidth: 15,
            semanticsLabel: "Chargement Des Enquettes En Cours ...",
          ),
        );
      }

    } else {

      if(context.watch<DataListAccidentProvider>().errorRequestListAccident){

        return Center(
          child: Text("Actualisez La Page...",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.redAccent
            ),
          ),
        );
      }else{
        return
          ListView.builder(
              itemCount: context
                  .watch<DataListAccidentProvider>()
                  .respDataAccidentListProvider
                  ?.length ?? 0,
              itemBuilder: (context, index) {
                final item = context
                    .watch<DataListAccidentProvider>()
                    .respDataAccidentListProvider?[index];


                // Sinon, afficher la ListView.builder
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),

                child: Column(
                    children: <Widget>[


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //-------------------Titre Numeroté de chaque Accident ------------------//
                          Text(
                            "Accident N° ${item?['id']}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(width: 10,),
                          ...GlobalMethod.getSeverityWidgets(item?['accidentSeverity'])
                        ],
                      ),


                      //-------------------Contenue simplifier de chaque Accident --------------//
                      Card(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          elevation: 5,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child:  SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[
                                  //------------------ Premier Details des accident photo , route, nombre vehicule Accidenté, Nombre de Victimes-----------//
                                  ListTile(

                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ControllerEnquete(idEnquete: item?['id'], isConsult: true)),
                                      );
                                    },

                                    //--------------------Image photos chaque Accident ----------------------------------------//
                                    leading: ProfilImageAccident(url_image: ParseDataImageCrash(dataImage: item?['crashImages']),context_image: context),

                                    //--------------------Detail Accident (Route position accident)--------------//
                                    title: Text(
                                      "Accident de type ${item?['accidentSeverity']}"
                                          " - A ${item?['city'] ?? 'Defaut City'} "
                                          " DE ${item?['municipality'] ?? 'Defaut Municipalite'}"
                                          " - Précisement a la place  ${item?["place"] ?? 'Defaut Place'} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          //color: GlobalMethod.getSeverityColor(item?['accidentSeverity'])
                                        color: Colors.blue
                                      ),
                                    ),

                                    //--------------------Detail Accident (nombre de vehicule accidenté, nombres de victime) --------------//
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [


                                        Text(
                                          "Impliquant ${item?['vehicules']?.length ?? 0} Vehicule(s), ${item?['persons']?.length ?? 0} Victime(s) ",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),


                                        ...(item?['drawing']?['name'] != null )
                                            ? [

                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                margin: EdgeInsets.symmetric(horizontal: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.black87,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child:Text(
                                                  "Croquis Ajouté",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                                  elevation: MaterialStateProperty.all(2),
                                                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 5)),
                                                  minimumSize: MaterialStateProperty.all(Size(25, 25)),
                                                ),
                                                onPressed: () {
                                                  ImagePreviewDialog.show(context, "${item?['drawing']?['path']}.png");
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.remove_red_eye_outlined,
                                                      color: Colors.black87,
                                                      size: 16,
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text('Voir le croquis',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ],
                                                ),



                                              ),
                                            ],
                                          ),

                                        ]
                                            :
                                        [
                                          SizedBox(),
                                        ]

                                      ],
                                    ),

                                    //-------------------- Option pour chaque Accident ----------------
                                    trailing: Container(
                                      //height: 5,
                                      margin: EdgeInsets.only(top: 8,),
                                      child: PopupMenuButton<OptionAccident>(
                                        onSelected: (OptionAccident optionAccident) {
                                          List<Map<String, dynamic>> listDeposition_receive =  item?['depots'].cast<Map<String, dynamic>>();


                                          if(item?['drawing']?['name'] == null ){
                                            context.read<TypeOptionProvider>().executeOption(context: context, typeOption: optionAccident.typeOption, idAccident: item?['id'], dataAccident: item, listDeposition_receive: listDeposition_receive);
                                          }else{
                                            context.read<TypeOptionProvider>().executeOption(context: context, typeOption: optionAccident.typeOption, idAccident: item?['id'], pathCroquis: item?['drawing']?['path'], dataAccident: item , listDeposition_receive: listDeposition_receive);
                                          }
                                        },

                                        itemBuilder: (BuildContext context) => TypeOptionProvider().generateurOptionAccident(idAccident: item?["id"], statusAccident: item?["status"]),

                                      ),
                                    ),
                                  ),

                                  //------------------ Espace de Division entre Datail accident et second Detail ------------------//
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Divider(
                                      thickness: 1,
                                      height: 2,
                                    ),
                                  ),

                                  //--------------------Second Detail Accident (date , heure , statut)--------------------------//
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      //-------------------Info Date Accident -----------------------------------//
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.calendar_month,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${item?['accidentDate'] ?? '00-00-000'}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),

                                      //-------------------Info Time Accident -----------------------------------//
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${item?['accidentTime'] ?? '00:00'}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),

                                      //-------------------Info Statut Accident -----------------------------------//
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: GenerateColorStatut(
                                                  Statut: item?['status']),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${item?['status']} ...",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),

                                  //--------------------Espace ----------------------------//
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ),

                      //-------------------Espace Entre chaque accident ------------------------//
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              }


          );
      }

    }


    //------------------ End Good -------------------------//

  }

  Color GenerateColorStatut({required String Statut}) {
    switch (Statut) {
      case "ACCEPTED":
        return Colors.green;
        break;
      case "REJECTED":
        return Colors.red;
        break;
      case "OPENED":
        return Colors.orange;
        break;
      case "READY":
        return Colors.blueAccent;
        break;
      default:
        return Colors.black87;
    }
  }

  printdataConsole(
      {required var dataprint, String description = "data print"}) {
    print("++");
    print("++");
    print("++");
    print(
        "++++++++++++++++++++++  Data $description    -------------------------------");
    print("++");
    print("+++++++++++ $dataprint");
    print("++");
    print(
        "++++++++++++++++++++++  Data $description    -------------------------------");
    print("++");
    print("++");
    print("++");
  }

  String ParseDataImageCrash({List<dynamic>? dataImage}) {

    if (dataImage != null && dataImage.isNotEmpty) {

      String dataString = dataImage[0]['path'] ?? "";
      //printdataConsole(dataprint: dataString, description: "image path convert text");

      return dataString;
    } else {
      return "";
    }
  }



}
