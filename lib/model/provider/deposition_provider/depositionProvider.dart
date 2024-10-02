import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/model/other_class_object/deposition_model.dart';


class ProviderDeposition with ChangeNotifier {


  TextEditingController? controllerIdentitePerson;
  TextEditingController? controllerDeposition;
  int? idEnquete;
  setIdEnquete(int? idEnquete) {
    this.idEnquete = idEnquete;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Deposition? depostion = Deposition();
  List<Deposition?> listDeposition = [];

  setListDeposition(List<Deposition?> listDeposition) {
    this.listDeposition = listDeposition;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }



  resetDataDepositionProvider() {
    controllerIdentitePerson = TextEditingController();
    controllerDeposition = TextEditingController();
    idEnquete = null;
    listDeposition = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  resetDataFormDepositionProvider() {
    controllerIdentitePerson = TextEditingController();
    controllerDeposition = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<bool> addDeposition() async {
    if (controllerIdentitePerson!.text.isNotEmpty && controllerDeposition!.text.isNotEmpty) {
      depostion = Deposition(
        accidentId: idEnquete,
        identityPerson: controllerIdentitePerson!.text,
        deposition: controllerDeposition!.text,
      );
      Logger().w("\n\n\nDeposition : ${depostion} \n\n\n ");
      listDeposition.add(depostion);
      resetDataFormDepositionProvider();
      return true;
    } else {
      return false;
    }
  }


  Future<List<Map<String, dynamic>>> getAllDeposition() async {
    List<Map<String, dynamic>> listDepositionMap = [];
    for (Deposition? deposition in listDeposition) {
      if (deposition != null){
        listDepositionMap.add(deposition.toJson_send_api());
      }
    }
    return listDepositionMap;
  }


  RefreshProviderDeposition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

}