

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/VariableData.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/model/api_network_request/drawing_signature/request_close_enquete_send_signature.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';

class MethodeManageSignature {


  SendSignatureToCloseEnquete({required BuildContext context, required String? PathImageDrawingSign, required int id_enquette}) async {

    MyDialogLoader.showLoadingDialog(context, "Cloture de l'enquête en cour ... ");

    if (isConnected) {

      Map<String, dynamic>? resultRequest = await RequestCloseEnqueteSendSignature(context: context,imagePathSignature: PathImageDrawingSign, id_enquete: id_enquette).then((resultRequest) {

        MyDialogLoader.hideLoadingDialog(context);

        if(resultRequest == null){

          functionToAlertError(context);

        }else{

          functionToSuccess(context);
        }


        print("data teminimer --------------------------------- ");
        return resultRequest;

      });

    }else{

      await MyDialogLoader.hideLoadingDialog(context);

      await functionToAlertError(context);


    }



    //---attente de 1 millisecond pour que le dialog de chargement soit visible
    //await Future.delayed(Duration(milliseconds: 1));






  }






  functionToSuccess(BuildContext context) async {
    //await MethodeLinkPersonInPatient(context: context, person: person);

    CustomBottomSheet(
      typeAction: 'success',
      heightFactor: 0.33,
      title: "Success",
      subTitle: "Confirmation enquete terminée avec Success",
      confirmAction: () async {

        print("print confirm ajout de croquis");
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
            "Enquete terminée avec Success",
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

        print("echec de Ajout de croquis");

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
          "Une Erreur est survenue lors de la cloture de l'enquette, Verifiez Votre connection Internet et reessayer plustard A la synchronisation Une fois connecté a internet",
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