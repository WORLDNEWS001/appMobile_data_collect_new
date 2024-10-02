




import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/VariableData.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/model/api_network_request/drawing_croquis/request_send_drawing_request.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Drawing.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';

class MethodeManageDrawingCroquis {


  AddDrawingCroquis({required BuildContext context, required DrawingResp? drawing, required int id_enquette}) async {

    MyDialogLoader.showLoadingDialog(context, "Ajout du croquis en cours ... ");


    DrawingResp? drawingRespApi;

    if (isConnected) {

      Map<String, dynamic>? resultRequest = await RequestSendDrawingCroquis(pathImageString: drawing?.path, id_enquette: id_enquette).then((resultRequest) {

        MyDialogLoader.hideLoadingDialog(context);

        if(resultRequest == null){
          context.read<ProviderColleteDataEnquete>().data_enq_drawingCroquis= drawing;

          functionToAlertError(context);
        }else{

          drawingRespApi = DrawingResp.fromJson(resultRequest["data"]);
          Logger().w("\n\n\n\n\n\n\n\n object Drawing croquis resultant apres envoie   :: \n\n ${drawingRespApi} \n\n");
          context.read<ProviderColleteDataEnquete>().data_enq_drawingCroquis = drawingRespApi;

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
      subTitle: "Confirmation Success ajout de croquis",
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
            "Ajout du croquis de l'enquette effectuée avec Success",
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
                "Une Erreur est survenue lors de l'ajout du croquis de l'enquette, Verifiez Votre connection Internet et reessayer plustard A la synchronisation Une fois connecté a internet",
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