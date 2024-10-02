import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/model/api_network_request/desactivate_enquete/request_desactivate_enquete.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';


class ControllerDesactivateEnquete {

  int? idEnquete;

  ControllerDesactivateEnquete({
    this.idEnquete,
  });

  Future<Map<String, dynamic>?> executeDesactivateEnquete({ required BuildContext context}) async {
    MyDialogLoader.showLoadingDialog(context, "Déactivation de l'enquete en cour ... ");

    await RequestDesactivateEnquete(id_enquette: idEnquete,).then((resultRequest) {
      MyDialogLoader.hideLoadingDialog(context);
      if (resultRequest?["success"] == true) {
        Logger().w(" ------------ Data DesactivateEnquete Effectuer avec Success ------- $resultRequest");
        functionToSuccess(context);
      }else{
        Logger().e(" ------------ Data DesactivateEnquete ECHOUE ------- $resultRequest");
        functionToAlertError(context);
      }
    }).onError((error, stackTrace) {
      Logger().e(" ------------ Data DesactivateEnquete ECHOUE ------- $error");
       MyDialogLoader.hideLoadingDialog(context);
    });


  }









  functionToSuccess(BuildContext context) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'success',
      heightFactor: 0.33,
      title: "Success",
      subTitle: "Confirmation Success Désactivation de l'enquete",
      confirmAction: () async {

        print("print confirm Desactivation de l'enquete");
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
            "Désactivation de l'enquette effectuée avec Success",
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
      subTitle: "Execution de la requette echouer",
      confirmAction: () async {

        print("echec de la desactivation de l'enquete");

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
          "Une Erreur est survenue lors de la desactivation de l'enquette, Verifiez Votre connection Internet et reessayer plustard A la synchronisation Une fois connecté a internet",
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