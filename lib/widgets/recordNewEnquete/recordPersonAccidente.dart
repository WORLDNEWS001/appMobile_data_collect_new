




import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/controller/ControllerManagerPerson/ControllerAddPerson.dart';
import 'package:secondtest/controller/ControllerManagerPerson/ControllerLinkPatientAccidente.dart';
import 'package:secondtest/model/api_network_request/personRequest/RequestUnlinkPersonPatient.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/services/enquete/managePerson/MethodeUnlinkPersonInPatient.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';






class RecordPersonAccidente extends StatefulWidget {
  final Function(int) onStepUpdated;
  List<PersonResp>? listPerson = [];
  bool isConsult;

  RecordPersonAccidente(
      {Key? key,
        required this.onStepUpdated,
        this.listPerson,
        this.isConsult = false,
      })
      : super(key: key);


  void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    print("je suis dans la fonction somme action du child de record Road ");
    onStepUpdated(2);
  }

  //--------------------  for update value step (MAKE function Some Action)

  @override
  State<RecordPersonAccidente> createState() => _RecordPersonAccidenteState();
}




class _RecordPersonAccidenteState extends State<RecordPersonAccidente> {

  List<PersonResp>? listPersonRecord = [];

  @override
  void initState() {
    super.initState();
    // Votre initialisation ou logique d'état ici
    //widget.someAction();
    //widget.testvalfile();
    listPersonRecord =
        context.read<ProviderColleteDataEnquete>().list_data_enq_persons;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    listPersonRecord =
        context.watch<ProviderColleteDataEnquete>().list_data_enq_persons;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //widget.testvalfile();
    return ListView.builder(
      itemCount: listPersonRecord?.length,
      itemBuilder: (BuildContext context, int index) {
        PersonResp? person = listPersonRecord?[index];

        return Card(
          color: Color.fromRGBO(255, 241, 211, 0.8784313725490196),

          child: ListTile(

            leading: Icon(
              Icons.person,
              size: 50,
              color: Colors.blueAccent,
            ),
            title: Text(
              "Person N° : ${person?.personAccidentNumber ?? ''} ${person?.firstName ?? ''} ${person?.lastName ?? ''} - Gravité : ${person?.traumaSeverity?.value ?? ''}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
                "Vehicule N°: ${person?.vehicleAccidentNumber ?? ''} - Genre : ${person?.gender?.value ?? ''} "),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                (person?.id != null && person?.id != 0)
                    ?

                (person?.care != null && person?.care != 0)
                    ?
                IconButton(

                  icon: Icon(
                    Icons.link_off_outlined,
                    size: 40,
                    color: Colors.red,
                  ),
                  onPressed: widget.isConsult ? null :
                      () async {

                    //await MethodeUnLinkPersonInPatient(context: context, person: person);
                    onPressToLinkPersonInPatient(personResp: person);

                  },
                )
                :
                IconButton(

                  icon: Icon(
                    Icons.link,
                    size: 40,
                    color: Colors.red,
                  ),

                  onPressed: widget.isConsult ? null :
                      () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ControllerLinkPatientAccidente(person: person),
                      ),
                    );

                  },
                )
                    :
                SizedBox(),

                IconButton(
                  icon: Icon(
                    Icons.delete_forever_sharp,
                    size: 30,
                    color: Colors.red,
                  ),
                  onPressed: widget.isConsult ? null :
                      () {
                    onPressToDeletePersonInPatient(personResp: person);
                    //context.read<ProviderColleteDataEnquete>().DeletePerson(personResp: person);
                  },
                ),
              ],
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ControllerAddPerson(person: person, isConsult: widget.isConsult),
                ),
              );
            },
          ),
        );
      },
    );
  }


  onPressToLinkPersonInPatient({required PersonResp? personResp}) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'attention',
      heightFactor: 0.3,
      title: "Dissociation Personne Accidentée - Patient",
      subTitle: "Confirmation de Dissociation",
      confirmAction: () async {

        await MethodeUnLinkPersonInPatient(context: context, person: personResp);

      },
      exitAction: () {
        print("Annuler");
      },
      content:Container(
        margin: EdgeInsets.all(50),
        height: 30,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Voulez-vous vraiment dissocier ${personResp?.firstName}-${personResp?.lastName} du patient ?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ).show(context);

  }




  onPressToDeletePersonInPatient({required PersonResp? personResp}) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'danger',
      heightFactor: 0.33,
      title: "Suppression de Personne Accidentée",
      subTitle: "Confirmation de Suppression",
      confirmAction: () async {

        context.read<ProviderColleteDataEnquete>().DeletePerson(personResp: personResp);

      },
      exitAction: () {
        print("Annuler");
      },
      content:Container(
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Voulez-vous vraiment Supprimer l'accidenté ${personResp?.firstName}-${personResp?.lastName} ?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ).show(context);

  }





}

























