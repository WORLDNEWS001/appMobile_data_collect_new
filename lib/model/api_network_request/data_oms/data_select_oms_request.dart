import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:http/http.dart' as http;
import 'package:secondtest/model/Class_setting/type_request_method.dart';
import 'package:secondtest/model/api_network_request/request_network_api.dart';

class SelectDataOmsRequest {

  BuildContext? context;

  SelectDataOmsRequest({
    this.context,
});


  Future<Map<String, dynamic>?> respSelectDataOmsRequest() async {


    RequestNetworkApi selectDataOmsRequest= RequestNetworkApi(
        context: context,
        EndPointUrl: "/accidents/oms-data",
        dataBodyJson: {},
        Description: "Data Select OMS",
        typeResquestMethod: TypeResquestMethod.get,
        dataHeaderJson: {
                        'lang': 'fr',
                        }
    );

    Map<String, dynamic>? response = await selectDataOmsRequest.responseRequest();
    Map<String, dynamic>? allDataOmsSelect = response?['data'];

   // List<Map<String, dynamic>> accidentSeverityResp = response['data']['accidentSeverityResp'];
    // Logger().d(" ------------ Data accidentSeverityResp ------- $allDataOmsSelect");
    return allDataOmsSelect;


  }




}