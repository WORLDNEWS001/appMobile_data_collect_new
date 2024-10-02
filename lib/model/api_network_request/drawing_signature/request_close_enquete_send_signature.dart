import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/model/Class_setting/type_request_method.dart';
import 'package:secondtest/model/api_network_request/request_network_api.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';


Future<Map<String, dynamic>?> RequestCloseEnqueteSendSignature({required BuildContext context,required String? imagePathSignature,required int? id_enquete }) async {


  //-- convertir l'image en utilisant le chemin d'acces de l'image en base64
  String? base64ImageSign = base64Encode(File(imagePathSignature!).readAsBytesSync());


  RequestNetworkApi ExecuteRequestAndResult= RequestNetworkApi(
      context: context,
      EndPointUrl: "/accidents/finish",
      dataBodyJson: {
        "id": id_enquete,
        "signature": base64ImageSign
      },
      Description: "SIGNATURE ET TERMINER UN ENQUETE",
      typeResquestMethod: TypeResquestMethod.post,
      dataHeaderJson: {
        'lang': 'fr',
        'Content-Type': 'application/json',
      }
  );

  Map<String, dynamic>? response = await ExecuteRequestAndResult.responseRequest();
  Map<String, dynamic>? dataResponse= response;

  Logger().w(" \n\n ------------ SIGNER ET TERMINER L ENQUETTE DONT LE ID EST :: $id_enquete avec le path de l'image signature temporaire qui est de :: $imagePathSignature -------response is :: \n\n $dataResponse \n\n ");

  return dataResponse;


}