




import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/model/api_network_request/personRequest/RequestUnlinkPersonPatient.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';

Future<Map<String,dynamic>?> MethodeUnLinkPersonInPatient({required PersonResp? person, required BuildContext context}) async {
  print("--------/////////--- UNLINK person in Patient ---/////////--------");

  Map<String,dynamic>? resultRequest;


  //MyDialogLoader.showLoadingDialog(context, "Recherche des patients en cour");
  MyDialogLoader.showLoadingDialog(context, "Désassociation de l'accidenté en cours");


  resultRequest = await UnLinkOnePersonInPatientRequest(context: context, onePerson: person).then((resultRequest) {

    if(resultRequest!=null){


      resultRequest = resultRequest;
      Logger().e("\n\n\n Resultat de la requette de UNLINK Person in Patient: $resultRequest \n\n\n");



    }else{
      print("\n\n\n  - UNLINK person in Patient -- ,resultRequest is null \n\n\n");
    }


  });

  Navigator.of(context, rootNavigator: true).pop();


  return resultRequest;
}
