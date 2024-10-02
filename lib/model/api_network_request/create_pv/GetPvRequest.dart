


import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/Class_setting/type_request_method.dart';
import 'package:secondtest/model/api_network_request/request_network_api.dart';
import 'package:secondtest/model/provider/create_pv_provider/ProviderCreatePv.dart';

Future<Map<String, dynamic>?> GetPvRequest({
  required BuildContext context,
  required int idEnquete,

}) async {



  RequestNetworkApi selectDataOmsRequest= RequestNetworkApi(
      context: context,
      EndPointUrl: "/accidents/get-report/$idEnquete",
      dataBodyJson: {},
      Description: "Get Data Pv Report",
      typeResquestMethod: TypeResquestMethod.get,
      dataHeaderJson: {
        'lang': 'fr',
      }
  );

  Map<String, dynamic>? response = await selectDataOmsRequest.responseRequest();
  Map<String, dynamic>? resultResponseData = response?['data'];

  // List<Map<String, dynamic>> accidentSeverityResp = response['data']['accidentSeverityResp'];
  // Logger().d(" ------------ Data accidentSeverityResp ------- $allDataOmsSelect");
  return resultResponseData;


}