


import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/Class_setting/type_request_method.dart';
import 'package:secondtest/model/api_network_request/request_network_api.dart';
import 'package:secondtest/model/provider/create_pv_provider/ProviderCreatePv.dart';

Future<Map<String, dynamic>?> CreatePvRequest({
  required BuildContext context,
  // required String dateAccident,
  // required String timeAccident,
  // required int idEnquete,
  // String? patrouille,
  // String? infoNous,
  // String? infoAssisteDe,
  // String? infoAvonsConstate,
  // String? infoAvonsDeLaCirculationSurvenu,
}) async {





  RequestNetworkApi resultRequest= RequestNetworkApi(
      context: context,
      EndPointUrl: "/accidents/send-report",
      dataBodyJson: {
        "assiste": "${context.read<ProviderCreatePv>().controllerInfoAssisteDeProvider?.text}",
        "circulation": "${context.read<ProviderCreatePv>().controllerInfoDeLaCirculationSurvenuProvider?.text}",
        "constate": "${context.read<ProviderCreatePv>().controllerInfoAvonsConstateProvider?.text}",
        "idaccident": context.read<ProviderCreatePv>().idEnquete ?? 351,
        "nous": "${context.read<ProviderCreatePv>().controllerInfoNousProvider?.text}",
        "patrouille": "${context.read<ProviderCreatePv>().controllerPatrouilleProvider?.text}",
        "reportId": context.read<ProviderCreatePv>().idReport_Pv ?? 0,
        //
        // "assiste": "joel",
        // "circulation": "joel",
        // "constate": "joel",
        // "idaccident": 351,
        // "nous": "jojo",
        // "patrouille": "patrouille",
        // "reportId": 0
      },
      Description: "Send data report to create PV ",
      typeResquestMethod: TypeResquestMethod.post,
      dataHeaderJson: {
        'lang': 'fr',
        'Content-Type': 'application/json',
      }
  );

  Map<String, dynamic>? response = await resultRequest.responseRequest();
  //Map<String, dynamic>? ResultRequestData = response?['data'];

  Map<String, dynamic>? ResultRequestData = response;

  // List<Map<String, dynamic>> accidentSeverityResp = response['data']['accidentSeverityResp'];
  // Logger().d(" ------------ Data accidentSeverityResp ------- $allDataOmsSelect");
  return ResultRequestData;


}