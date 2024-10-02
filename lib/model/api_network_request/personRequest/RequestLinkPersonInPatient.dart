import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/model/Class_setting/type_request_method.dart';
import 'package:secondtest/model/api_network_request/request_network_api.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';


Future<Map<String, dynamic>?> LinkOnePersonInPatient({required BuildContext context,required PersonResp onePerson,required int? idPatient }) async {


  RequestNetworkApi selectDataOmsRequest= RequestNetworkApi(
      context: context,
      EndPointUrl: "/accidents/join-person-accident",
      dataBodyJson: {
        "careId": idPatient,
        "personAccidentId": onePerson.id
      },
      Description: "liason Accidenté au patien",
      typeResquestMethod: TypeResquestMethod.post,
      dataHeaderJson: {
        'lang': 'fr',
        'Content-Type': 'application/json',
      }
  );

  Map<String, dynamic>? response = await selectDataOmsRequest.responseRequest();
  Map<String, dynamic>? dataResponse= response;

  Logger().w(" \n\n ------------ LIaison de l'accidenter :: $onePerson au patient avec id:: $idPatient -------response is :: \n\n $dataResponse \n\n ");

  return dataResponse;


}

