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

class ListEnqueteParGravite extends StatefulWidget {
  const ListEnqueteParGravite({Key? key}) : super(key: key);

  String TextTitle(){
    return "Liste Enquête(e) Classés Par Gravité";
  }

  @override
  State<ListEnqueteParGravite> createState() => _ListEnqueteParGraviteState();


}

class _ListEnqueteParGraviteState extends State<ListEnqueteParGravite> {

  List<Map<String, dynamic>?>? respDataAccidentDisplayParGraviteList = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    respDataAccidentDisplayParGraviteList = context.watch<DataListAccidentProvider>().respDataAccidentListParGraviteProvider ?? [];

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<DataListAccidentProvider>().UpdateDataAccidentListProvider();
    Logger().e("***************** // INIT STATE PAGE ListEnqueteParGravite // *****************");
    respDataAccidentDisplayParGraviteList = context.read<DataListAccidentProvider>().respDataAccidentListParGraviteProvider ?? [];

  /*
    setState(() {
      print("Liste triée par gravité: $respDataAccidentListParGravite");
      print("Liste non trier: $respDataAccidentDisplayList");
    });
 */

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
              itemCount: respDataAccidentDisplayParGraviteList?.length ?? 0,
              itemBuilder: (context, index) {

                final item = respDataAccidentDisplayParGraviteList?[index];
                // Sinon, afficher la ListView.builder
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),

                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //-------------------Titre Numeroté de chaque Accident ------------------//
                          Text(
                            "Accident N° ${item?['id']}",
                            style: TextStyle(
                              fontSize: 17,
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
                        elevation: 10,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
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
                                        fontSize: 18,
                                        color: Colors.blue
                                        //color: GlobalMethod.getSeverityColor(item?['accidentSeverity'])
                                    ),
                                  ),

                                  //--------------------Detail Accident (nombre de vehicule accidenté, nombres de victime) --------------//
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Impliquant ${item?['vehicules']?.length ?? 0} Vehicule(s), ${item?['persons']?.length ?? 0} Victime(s) ",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),


                                      ...(item?['drawing']?['name'] != null )
                                          ? [

                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              margin: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child:Text(
                                                "Croquis Ajouté",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                ImagePreviewDialog.show(context, "${item?['drawing']?['path']}.png");
                                                // Ou pour une image locale
                                                // ImagePreviewDialog.show(context, '/path/to/your/local/image.jpg');
                                              },
                                              child: Text('Voir le croquis'),
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
                                    height: 200,
                                    margin: EdgeInsets.only(top: 12,),
                                    child: PopupMenuButton<OptionAccident>(
                                      onSelected: (OptionAccident optionAccident) {
                                        if(item?['drawing']?['name'] == null ){
                                        context.read<TypeOptionProvider>().executeOption(context: context, typeOption: optionAccident.typeOption, idAccident: item?['id']);
                                        }else{
                                          context.read<TypeOptionProvider>().executeOption(context: context, typeOption: optionAccident.typeOption, idAccident: item?['id'], pathCroquis: item?['drawing']?['path']);
                                        }
                                      },

                                      itemBuilder: (BuildContext context) {

                                          return TypeOptionProvider().generateurOptionAccident(idAccident: item?["id"], statusAccident: item?["status"]);

                                      }
                                      //itemBuilder: (BuildContext context) => popUpOptionAccidentBuildMethod(idAccident: item?["id"], statutThisAccident:  item?["status"]

                                    ),
                                  ),
                                ),

                                //------------------ Espace de Division entre Datail accident et second Detail ------------------//
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Divider(
                                    thickness: 1,
                                    height: 20,
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
                                          style: TextStyle(color: Colors.black54),
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
                        height: 15,
                      ),
                    ],
                  ),
                );
              }


          );
      }

    }
/*
    //------------Good ----------
     ListView.builder(
          itemCount: respDataAccidentDisplayList.length,
          itemBuilder:(context, index) {
            final item = respDataAccidentDisplayList[index];
            return Container(
              child: Column(
                children: <Widget>[
                  //-------------------Titre Numeroté de chaque Accident ------------------//
                  Text(
                    "Accident N° ${item?['id']}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  //-------------------Contenue simplifier de chaque Accident --------------//
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          //------------------ Premier Details des accident photo , route, nombre vehicule Accidenté, Nombre de Victimes-----------//
                          ListTile(

                            //--------------------Image photos chaque Accident ----------------------------------------//
                            leading: ProfilImageAccident(
                                url_image: ParseDataImageCrash(
                                    dataImage: item?['crashImages'])),

                            //--------------------Detail Accident (Route position accident)--------------//
                            title: Text(
                              "Route ${item?['place'] ?? 'Defaut Place'} ${item?['municipality'] ?? 'Defaut Municipalite'}   ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            //--------------------Detail Accident (nombre de vehicule accidenté, nombres de victime) --------------//
                            subtitle: Text(
                                "${item?['vehicules']?.length ?? 0} Vehicule Accidentés, ${item?['persons']?.length ?? 0} Victimes"
                            ),

                            //-------------------- Option pour chaque Accident ----------------
                            trailing: Container(
                              height: 200,
                              margin: EdgeInsets.only(top: 12,),
                              child: PopupMenuButton<OptionAccident>(
                                onSelected: (OptionAccident optionAccident) {

                                  context.read<TypeOptionProvider>().executeOption(typeOption: optionAccident.typeOption,idAccident: item?['id']);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("c'est le bonbon de type ${optionAccident.textDisplay} ou encore ${optionAccident.typeOption}qui a ete selectionner , Ayant pour ID == ${optionAccident.id}"),
                                    ),
                                  );
                                },

                                itemBuilder: (BuildContext context) => TypeOptionProvider().generateurOptionAccident(idAccident: item?["id"], statusAccident: item?["status"]),
                                //itemBuilder: (BuildContext context) => popUpOptionAccidentBuildMethod(idAccident: item?["id"], statutThisAccident:  item?["status"]

                              ),
                            ),
                          ),

                          //------------------ Espace de Division entre Datail accident et second Detail ------------------//
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              thickness: 1,
                              height: 20,
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
                                    style: TextStyle(color: Colors.black54),
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

                  //-------------------Espace Entre chaque accident ------------------------//
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          }

    );

 */



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
