import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/controller/ControllerDeposition/DepositionDialog.dart';
import 'package:secondtest/model/api_network_request/deposition/request_save_all_deposition.dart';
import 'package:secondtest/model/other_class_object/deposition_model.dart';
import 'package:secondtest/model/provider/deposition_provider/depositionProvider.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';

class ControllerDeposition extends StatefulWidget {
  int? idEnquete;
  List<Map<String, dynamic>>? listDeposition_request =[
    {
      "name": "joel",
      "commentaire": "jkshfksff"
    },
    {
      "name": "sdjhf",
      "commentaire": "sdfkjsdhflks"
    },
    {
      "name": "dfgdsg",
      "commentaire": "dhghhgf"
    }
  ];
   ControllerDeposition({
     super.key,
     this.listDeposition_request,
    required this.idEnquete,
   });

  @override
  State<ControllerDeposition> createState() => _ControllerDepositionState();
}

class _ControllerDepositionState extends State<ControllerDeposition> {

  List<Map<String, dynamic>>? listDeposition_request_sample = [
    {
    "name": "joel",
    "commentaire": "jkshfksff"
    },
    {
    "name": "sdjhf",
    "commentaire": "sdfkjsdhflks"
    },
    {
    "name": "dfgdsg",
    "commentaire": "dhghhgf"
    }
  ];

  List<Deposition?> listDeposition_request_make = [];
  List<Map<String, dynamic>?>? listDeposition_receive = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initialiseData(data_deposition: widget.listDeposition_request, context: context);
    context.read<ProviderDeposition>().resetDataDepositionProvider();
    listDeposition_receive = widget.listDeposition_request;

  }
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    listDeposition_request_make = context.watch<ProviderDeposition>().listDeposition ;
    context.read<ProviderDeposition>().setIdEnquete(widget.idEnquete);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Icons.comment_rounded,
            size: 35,),
          SizedBox(width: 10),
          Text("Ajouter les dépositions"),
        ],)
      ),
      body:
          SingleChildScrollView(
            child: Column(
              children: [

                ...listDeposition_receive!.isEmpty ? [] : [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("Liste Dépositions deja ajoutées",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.orange[50],
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: //--- displays list Deposition (name and comment) ---
                      ListView.builder(
                        itemCount: listDeposition_receive!.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic>? oneDepositionReceive = listDeposition_receive?[index];
                          return Container(
                            margin: EdgeInsets.all(6),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:ListTile(
                              contentPadding: EdgeInsets.all(10),
                              leading: Icon(
                                Icons.comment_rounded,
                                size: 35,
                                color: Colors.orangeAccent,
                              ),
                              trailing: Icon(
                                Icons.check_circle_outline,
                                size: 35,
                                color: Colors.orangeAccent,
                              ),
                              title: Text("identité du personage : ${oneDepositionReceive?["name"] ?? 'no person'}"),
                              subtitle: Text("Sa Deposition :  ${oneDepositionReceive?["commentaire"] ?? 'no deposition'} "),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                ],

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("Liste Dépositions En cours d'ajout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: //--- displays list Deposition (name and comment) ---
                      ListView.builder(
                        itemCount: listDeposition_request_make.length,
                        itemBuilder: (context, index) {
                          Deposition? oneDeposition = listDeposition_request_make[index];
                          return Container(
                            margin: EdgeInsets.all(6),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:ListTile(
                              contentPadding: EdgeInsets.all(10),
                              leading: Icon(
                                Icons.comment_rounded,
                                size: 35,
                                color: Colors.grey,
                              ),
                              /*trailing: Icon(
                            Icons.check_circle_outline,
                            size: 35,
                            color: Colors.orangeAccent,
                          ),*/
                              title: Text("identité du personage : ${oneDeposition?.identityPerson ?? 'no person'}"),
                              subtitle: Text("Sa Deposition :  ${oneDeposition?.deposition ?? 'no deposition'} "),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

              ]
            ),
          ),

      //--- inserer une liste de FloatingActionButton alligner verticalement
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDepositionDialog(context);
            },
            child: Icon(
                Icons.add,
              size: 50,
            ),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () async {

              await onpressedSaveData(context: context);

            },
            child: Icon(
              Icons.check_circle,
              size: 50,
              color: Colors.green,
            ),
          ),
        ],
      ),

      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDepositionDialog(context);
        },
        child: Icon(Icons.add),
      ),*/
    );
  }




  Future<void> initialiseData({required List<Map<String, dynamic>>? data_deposition, required BuildContext context}) async {
    List<Deposition> listDepositionInit = [];

    if(data_deposition == null || data_deposition.isEmpty){

    }else{
      listDepositionInit =data_deposition.map((e) {
        Deposition oneDeposition = Deposition(
          identityPerson: e["name"],
          deposition: e["commentaire"],
          accidentId: widget.idEnquete,
        );
        return oneDeposition;
      }).toList();

      context.read<ProviderDeposition>().setListDeposition(listDepositionInit);
    }

  }


  Future<void> onpressedSaveData({required BuildContext context}) async {
    List<Deposition?>? listAllDepositionTake = context.read<ProviderDeposition>().listDeposition;
    print("\n\n\n Liste des dépositions : $listAllDepositionTake \n\n\n ");

    MyDialogLoader.showLoadingDialog(context, "Enregistrement des dépositions de l'enquete en cour ... ");

    await RequestSaveAllDeposition(id_enquette: widget.idEnquete, listDepositionSend: listAllDepositionTake).then((resultRequest) {
      MyDialogLoader.hideLoadingDialog(context);
      if(resultRequest?["success"] == true){

        print("\n\n\n Enregistrement des dépositions reussi \n\n\n");
        Logger().w(" ------------ Ajout dépositions reussi Effectuer avec Success ------- $resultRequest");
        functionToSuccess(context);

      }else{

        print("\n\n\n Enregistrement des dépositions echoué \n\n\n");
        Logger().e(" ------------  Ajout dépositions ECHOUE ------- $resultRequest");
        functionToAlertError(context);

      }
    });

  }



  
  
  
  
  
  functionToSuccess(BuildContext context) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'success',
      heightFactor: 0.33,
      title: "Success",
      subTitle: "Confirmation Success Ajouts des dépositions",
      confirmAction: () async {

        print("print confirm Ajouts des dépositions de l'enquete");
        //--- attendre 1 millisecond pour que le dialog de chargement soit visible
        await Future.delayed(Duration(milliseconds: 100));

        //------ naviger vers la page de l'accident listAccident() -- en annulant toute la pile d'arbre de navigation
        await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) => listAccident()
        ), (route) => false);

      },
      exitAction: () {
        print("Annuler");
      },
      content:Container(
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(10),
        // height: 200,
        decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Ajouts des dépositions de l'enquette effectuée avec Success",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ).show(context);

  }



  functionToAlertError(BuildContext context) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'danger',
      heightFactor: 0.4,
      title: "Echec",
      subTitle: "Execution de Ajouts des dépositions",
      confirmAction: () async {

        print("echec de l'ajouts des dépositions de l'enquete");

      },
      exitAction: () {
        print("Annuler");
      },
      content:Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        //height: 100,
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "Une Erreur est survenue lors de l'ajouts des dépositions de l'enquette, Verifiez Votre connection Internet et reessayer plustard A la synchronisation Une fois connecté a internet",
          //"Une Erreur est survenue lors de l'ajout du croquis de l'enquette*--",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),


      ),
    ).show(context);

  }


}
