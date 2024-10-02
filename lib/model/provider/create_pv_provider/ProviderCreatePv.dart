



import 'package:flutter/material.dart';

class ProviderCreatePv with ChangeNotifier {



  TextEditingController? controllerDateProvider;
  TextEditingController? controllerHeureProvider;
  int? idEnquete;
  int? idReport_Pv;

  TextEditingController? controllerPatrouilleProvider;
  TextEditingController? controllerInfoNousProvider;
  TextEditingController? controllerInfoAssisteDeProvider;
  TextEditingController? controllerInfoAvonsConstateProvider;
  TextEditingController? controllerInfoDeLaCirculationSurvenuProvider;


  resetDataProviderCreatePv() {
    controllerDateProvider = TextEditingController();
    controllerHeureProvider = TextEditingController();
    controllerPatrouilleProvider = TextEditingController();
    controllerInfoNousProvider = TextEditingController();
    controllerInfoAssisteDeProvider = TextEditingController();
    controllerInfoAvonsConstateProvider = TextEditingController();
    controllerInfoDeLaCirculationSurvenuProvider = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  RefreshProviderCreatePv() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }


}