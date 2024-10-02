import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/controller/ControllerManagerPerson/ControllerAddPerson.dart';
import 'package:secondtest/model/api_network_request/personRequest/RequestLinkPersonInPatient.dart';
import 'package:secondtest/model/api_network_request/personRequest/RequestTakeAllPatient.dart';
import 'package:secondtest/model/api_network_request/personRequest/RequestUnlinkPersonPatient.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';






class ControllerLinkPatientAccidente extends StatefulWidget {

  PersonResp? person;

  ControllerLinkPatientAccidente({
        Key? key,
        required this.person,
      }) : super(key: key);


  void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    print("je suis dans la fonction somme action du child de record Road ");

  }

  //--------------------  for update value step (MAKE function Some Action)

  @override
  State<ControllerLinkPatientAccidente> createState() => _ControllerLinkPatientAccidenteState();
}




class _ControllerLinkPatientAccidenteState extends State<ControllerLinkPatientAccidente> {

  PersonResp? personPatient;
  List<Map<String, dynamic>?> listPatient = [];
  List<Map<String, dynamic>?> listPatientUnLink = [];

  @override
  void initState() {
    super.initState();

    personPatient = widget.person;
    /*
    listPatient = [

      {
        "id": 240,
        "cni": "123344567",
        "nom": "",
        "prenom": "gg",
        "telephone": "777788877",
        "dateNaiss": null,
        "passport": "77777",
        "permis": "66777",
        "gender": "Femme",
        "accparams": {
          "persontrauma": "2",
          "consumalcohol": "non",
          "consumdrugs": "non"
        },
        "parametre": {
          "poids": "7",
          "temperature": "4",
          "pouls": "6",
          "tension": "3",
          "params": [
            "cardiaque"
          ]
        },
        "crashDate": null,
        "status": "OPENED",
        "code": "CARE449",
        "amount": 60000.0,
        "hopital": "Hôpital Sacré coeur",
        "amountAccepted": 0.0,
        "trauma": "Traumatisme grave/sérieux",
        "insurance": "UNLINKED",
        "accidentRole": "UNKNOW",
        "description": "Pas de donnees"
      },
      {
        "id": 227,
        "cni": "123655483",
        "nom": "passager1",
        "prenom": "Aout02",
        "telephone": "698758579",
        "dateNaiss": "2000-08-02",
        "passport": "1223654788",
        "permis": "44654555522",
        "gender": "Homme",
        "accparams": {
          "persontrauma": "2",
          "consumalcohol": "non",
          "consumdrugs": "oui"
        },
        "parametre": {
          "poids": "52",
          "temperature": "41",
          "pouls": "21",
          "tension": "21",
          "params": [
            "hypertension",
            "cardiaque"
          ]
        },
        "crashDate": "2023-08-01 10:02",
        "status": "OPENED",
        "code": "",
        "amount": 0.0,
        "hopital": "Hôpital Sacré coeur",
        "amountAccepted": 0.0,
        "trauma": "Traumatisme grave/sérieux",
        "insurance": "UNRECOGNIZED",
        "accidentRole": "Passager",
        "description": null
      },
      {
        "id": 223,
        "cni": "1236555554",
        "nom": "pieton1",
        "prenom": "roger",
        "telephone": "425365452",
        "dateNaiss": "2018-04-04",
        "passport": "23656446665",
        "permis": "12545",
        "gender": "Femme",
        "accparams": {
          "persontrauma": "2",
          "consumalcohol": "non",
          "consumdrugs": "non"
        },
        "parametre": {
          "poids": "12",
          "temperature": "",
          "pouls": "",
          "tension": "",
          "params": [
            ""
          ]
        },
        "crashDate": "2019-04-09 12:27",
        "status": "OPENED",
        "code": "CARE357",
        "amount": 0.0,
        "hopital": "AD Lucem",
        "amountAccepted": 0.0,
        "trauma": "Traumatisme grave/sérieux",
        "insurance": "", //--deja lier
        "accidentRole": "Piéton",
        "description": null
      },
      {
        "id": 214,
        "cni": "534446855",
        "nom": "fogno",
        "prenom": "lisette",
        "telephone": "698565895",
        "dateNaiss": "2023-03-01",
        "passport": "512",
        "permis": "53446876",
        "gender": "Femme",
        "accparams": {
          "persontrauma": "2",
          "consumalcohol": "non",
          "consumdrugs": "non"
        },
        "parametre": {
          "poids": "50",
          "temperature": "17",
          "pouls": "",
          "tension": "17",
          "params": [
            ""
          ]
        },
        "crashDate": "2023-03-01 12:41",
        "status": "OPENED",
        "code": "CARE332",
        "amount": 0.0,
        "hopital": "AD Lucem",
        "amountAccepted": 0.0,
        "trauma": "Traumatisme grave/sérieux",
        "insurance": "UNLINKED",  //Non Lier
        "accidentRole": "UNKNOW",
        "description": null
      },
      {
        "id": 213,
        "cni": "65504646546",
        "nom": "fogno",
        "prenom": "lazare",
        "telephone": "245646464",
        "dateNaiss": "2017-03-06",
        "passport": "",
        "permis": "",
        "gender": "Homme",
        "accparams": {
          "persontrauma": "2",
          "consumalcohol": "non",
          "consumdrugs": "oui"
        },
        "parametre": {
          "poids": "45",
          "temperature": "45",
          "pouls": "12",
          "tension": "45",
          "params": [
            ""
          ]
        },
        "crashDate": "2023-03-01 12:37",
        "status": "OPENED",
        "code": "CARE331",
        "amount": 0.0,
        "hopital": "Hôpital Sacré coeur",
        "amountAccepted": 0.0,
        "trauma": "Traumatisme grave/sérieux",
        "insurance": "UNLINKED",  // non lier
        "accidentRole": "UNKNOW",
        "description": null
      },
      {
        "id": 208,
        "cni": "212365445",
        "nom": "TAGNE",
        "prenom": "Alain",
        "telephone": "236585469",
        "dateNaiss": "1980-02-08",
        "passport": "",
        "permis": "",
        "gender": "Homme",
        "accparams": {
          "persontrauma": "2",
          "consumalcohol": "non",
          "consumdrugs": "oui"
        },
        "parametre": {
          "poids": "75",
          "temperature": "40",
          "pouls": "21",
          "tension": "21",
          "params": [
            "ashtme"
          ]
        },
        "crashDate": "2023-02-02 12:22",
        "status": "OPENED",
        "code": "CARE326",
        "amount": 0.0,
        "hopital": "Hôpital Sacré coeur",
        "amountAccepted": 0.0,
        "trauma": "Traumatisme grave/sérieux",
        "insurance": "Auto Insurance",
        "accidentRole": "Conducteur",
        "description": null
      },

    ];*/

    // trier la liste listpatient et extraire les Map patient dont le status est UNLINKED
    //listPatientUnLink = listPatient.where((element) => element?["insurance"] == "UNLINKED").toList();

    Logger().w("\n\n\n Liste des patients non lier : $listPatientUnLink \n\n\n");

    //listPatient = listPatientUnLink;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //widget.testvalfile();
    return Scaffold(
        appBar: AppBar(
          title: Text("Liste des Personnes"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.local_hospital),
              onPressed: () {
                /*
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ControllerAddPerson(),
                  ),
                );
                 */
              },
            ),
          ],
        ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(220, 240, 255, 0.9686274509803922),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Lié une personne accidentée à un patient",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.blueAccent,
                              ),
                            ),

                            Text("Personne Accidentée :\n${personPatient?.firstName} ${personPatient?.lastName}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),





                      Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            size: 50,
                            color: Colors.blueAccent,
                          ),
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Rechercher un patient',
                                  ),
                                  onChanged: (value) {
                                    TakeListPatient(value);
                                    setState(() {

                                    });
                                  },
                                ),
                              ),
                          )

                        ],
                      ),
                    ],
                  ),
                  //height: 500,

                ),





              Expanded(
                  child: ListView.builder(
                    itemCount: listPatient.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic>? patient = listPatient[index];

                      return Card(
                        color: Color.fromRGBO(255, 241, 211, 0.8784313725490196),

                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(

                            leading: Icon(
                              Icons.local_hospital_outlined,
                              size: 50,
                              color: Colors.blueAccent,
                            ),
                            title: Text(
                              //"Person N° : ${person?.personAccidentNumber ?? ''} ${person?.firstName ?? ''} ${person?.lastName ?? ''} - Gravité : ${person?.traumaSeverity?.value ?? ''}",
                              'Nom Complet : ${patient?["nom"]} ${patient?["prenom"]} \nCNI: ${patient?["cni"]} - Telephone: ${patient?["telephone"]}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Genre : ${patient?["gender"]} \nHopital : ${patient?["hopital"]}",
                            ),
                            trailing: Icon(
                              Icons.link,
                              size: 40,
                              color: Colors.blueAccent,
                            ),
                            onTap: () {

                             LinkPersonInPatien(patient, personPatient!);

                            },
                          ),
                        ),

                      );
                    },
                  ),
              )


            ]
          ),
        )

    );




  }

  LinkPersonInPatien(Map<String, dynamic>? dataPatient, PersonResp onePerson) async {
    print("--------/////////---  Create New Person  ---/////////--------");
    PersonResp? person=widget.person;
   // PersonResp? person=context.read<ProviderColleteDataEnquete>().DataFormPerson;
    Map<String,dynamic>? resultRequest;
    if (widget.person != null) {

       MyDialogLoader.showLoadingDialog(context, "Association de l'accidenté au patient en cours");

      resultRequest = await LinkOnePersonInPatient(context: context, onePerson: onePerson, idPatient: dataPatient?["id"]).then((result) async {

        if (result != null){
          Map<String,dynamic>? resultRequest = result["data"];
          Logger().w("\n\n\n\n\n\n\n\n object Result data Request link Person in Patient :: \n\n ${resultRequest} \n\n");
          List<Map<String, dynamic>?> listPersonUpdate = List<Map<String, dynamic>?>.from(resultRequest?["persons"]);

          Map<String, dynamic>? personUpdate = listPersonUpdate.firstWhere((element) => element?["id"] == onePerson.id);
          PersonResp personResp = PersonResp.fromJsonRequest(personUpdate, context);

          Logger().e("\n\n\n\n\n\n\n\n le nouvelle objet Personne accidenter generer apres liaison est  :: \n\n ${personResp} \n\n");

          context.read<ProviderColleteDataEnquete>().UpdateLinkPersonInPatientCare(New_personResp_after_link: personResp, Old_personResp: onePerson);

        }else{

        }
        Navigator.pop(context);
        Navigator.pop(context);

        /*
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
        });

         */

      });


    } else {
      /*
      //MyDialogLoader.showLoadingDialog(context, "Création de l'enquette en cour ");
      resultRequest = await person?.executeRequestCreatePerson().then((value) async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecordNewPerson()),
        );
      });
       */
    }
    return resultRequest;
  }



  Future<Map<String,dynamic>?> TakeListPatient(String? takeDataSearch) async {
    print("--------/////////---  Create New Person  ---/////////--------");

    Map<String,dynamic>? resultRequest;


      //MyDialogLoader.showLoadingDialog(context, "Recherche des patients en cour");

      resultRequest = await RequestTakeAllPatient(context: context, dataSearch: takeDataSearch).then((resultRequest) {

        if(resultRequest!=null){
          // convert the list List<dynamic> result resultRequest to List<Map<String, dynamic>?>
          listPatient = List<Map<String, dynamic>?>.from(resultRequest["data"]);
          listPatientUnLink = listPatient.where((element) => element?["insurance"] == "UNLINKED").toList();
          listPatient = listPatientUnLink;
          //Logger().e("\n\n\n Liste de tout les patient: $listPatientUnLink \n\n\n");
          //Logger().e("\n\n\n Liste des patients non lier : $listPatientUnLink \n\n\n");
          setState(() {
          });
        }else{
          setState(() {
            listPatient = [];
          });
        }


      });


    return resultRequest;
  }










}


