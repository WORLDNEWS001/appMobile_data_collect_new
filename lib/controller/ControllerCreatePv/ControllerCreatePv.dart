
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/CreatePv/ViewFormCreatePv.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/model/api_network_request/create_pv/CreatePvRequest.dart';
import 'package:secondtest/model/api_network_request/create_pv/GetPvRequest.dart';
import 'package:secondtest/model/provider/create_pv_provider/ProviderCreatePv.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';


class ControllerCreatePv extends StatefulWidget {
  String? dateAccident;
  String? timeAccident;
  int? idEnquete;
   ControllerCreatePv({
     super.key,
      required this.dateAccident,
      required this.timeAccident,
      required this.idEnquete,
   });

  @override
  State<ControllerCreatePv> createState() => _ControllerCreatePvState();
}

class _ControllerCreatePvState extends State<ControllerCreatePv> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiseData();

  }

  @override
  Widget build(BuildContext context) {
    return ViewFormCreatePv(
        onSaveDataPvAndSendRequest: onSaveDataPvAndSendRequest,
        initDataExecuteGet: initialiseData,
        dateAccident: widget.dateAccident,
        timeAccident: widget.timeAccident,
    );
  }



  onSaveDataPvAndSendRequest() async{

    print("\n\n\n sauvegarde des donnee du PV  \n\n\n");

    await CreatePvRequest(context: context).then((resultRequest) {
      if (resultRequest?["success"] == true) {
        Logger().w(" ------------ Data CreatePvRequest ------- $resultRequest");
        functionToSuccess(context);
      }else{
        Logger().w(" ------------ ECHEC CreatePvRequest ------- $resultRequest");

        functionToAlertError(context);
      }


    });




  }


   Future<void> initialiseData() async {

    print("Chargement des donnee du PV  ");
    //onStepUpdated(2);

    context.read<ProviderCreatePv>().resetDataProviderCreatePv();
    context.read<ProviderCreatePv>().controllerDateProvider?.text = widget.dateAccident!;
    context.read<ProviderCreatePv>().controllerHeureProvider?.text = widget.timeAccident!;
    context.read<ProviderCreatePv>().idEnquete = widget.idEnquete;

    if(widget.idEnquete != null){

          Map<String, dynamic>? dataResultGetPv = await GetPvRequest(context: context, idEnquete: widget.idEnquete!).then((dataResultGetPv) {

            if(dataResultGetPv != null){
              context.read<ProviderCreatePv>().idEnquete = dataResultGetPv['idaccident'];
              context.read<ProviderCreatePv>().idReport_Pv = dataResultGetPv['reportId'];

              print("\n\n\n\n\n ID ENQUETE :::: ${dataResultGetPv['idaccident']}");
              print("\n\n\n\n\n ID REPORT PV :::: ${dataResultGetPv['reportId']}");

              context.read<ProviderCreatePv>().controllerPatrouilleProvider?.text = dataResultGetPv['patrouille'] ?? "";
              context.read<ProviderCreatePv>().controllerInfoNousProvider?.text = dataResultGetPv['nous']?? "";
              context.read<ProviderCreatePv>().controllerInfoAssisteDeProvider?.text = dataResultGetPv['assiste']?? "";
              context.read<ProviderCreatePv>().controllerInfoAvonsConstateProvider?.text = dataResultGetPv['constate']?? "";
              context.read<ProviderCreatePv>().controllerInfoDeLaCirculationSurvenuProvider?.text = dataResultGetPv['circulation']?? "";
            }
            return dataResultGetPv;

          });

          Logger().w(" ------------ Data GetPvRequest ------- $dataResultGetPv");

    }else{

    }

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
            "Constitution du PV effectué avec Success",
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

        print("Execution de la requette echouer--------- exe");

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
          "Une Erreur est survenue lors de l'ajout des données du pv, Verifiez Votre connection Internet et reessayer plustard A la synchronisation Une fois connecté a internet",
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
