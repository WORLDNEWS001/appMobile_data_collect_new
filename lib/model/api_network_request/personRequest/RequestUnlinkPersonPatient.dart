import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/model/Class_setting/type_request_method.dart';
import 'package:secondtest/model/api_network_request/request_network_api.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';


Future<Map<String, dynamic>?> UnLinkOnePersonInPatientRequest({required BuildContext context,required PersonResp? onePerson}) async {


  RequestNetworkApi Result= RequestNetworkApi(
      context: context,
      EndPointUrl: "/accidents/unjoin-person-accident",
      dataBodyJson: {
        "personAccidentId": onePerson?.id
      },
      Description: "Delier un patien d'un accidenté",
      typeResquestMethod: TypeResquestMethod.post,
      dataHeaderJson: {
        'lang': 'fr',
        'Content-Type': 'application/json',
      }
  );

  Map<String, dynamic>? response = await Result.responseRequest();
  Map<String, dynamic>? dataResponse= response;

  if(dataResponse?["success"] == true) {
    print("\n\n\n  - UNLINK person in Patient -- ,resultRequest Effectuer avec success  \n\n\n");
    PersonResp? New_onePerson = onePerson?.copyWith(care: 0);
    context.read<ProviderColleteDataEnquete>().UpdateLinkPersonInPatientCare(New_personResp_after_link: New_onePerson, Old_personResp: onePerson);

  }else{
    print("\n\n\n  - UNLINK person in Patient -- ,resultRequest A echouer \n\n\n");
  }

  Logger().w(" \n\n ------------ Delier de l'accidenter :: $onePerson -------response is :: \n\n $dataResponse \n\n ");

  return dataResponse;


}

