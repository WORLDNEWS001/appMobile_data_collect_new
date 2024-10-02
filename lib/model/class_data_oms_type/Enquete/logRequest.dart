import 'dart:convert';

import 'package:secondtest/model/enum/StatusRequest.dart';
import 'package:secondtest/model/enum/StatusRequest.dart';


class LogRequest{

   int? id;
   String? logRequest;
   String? logResponse;
   String? typeRequest;
   StatusRequest statusRequest;
   String? dateCreateRequest;
   String? dateCreateResponse;

    LogRequest({
      this.id,
      required this.logRequest,
      required this.logResponse,
      required this.typeRequest,
      required this.statusRequest,
      required this.dateCreateRequest,
      required this.dateCreateResponse
    });

    //----------create methode fromJson
    factory LogRequest.fromJson(Map<String, dynamic>? json) {
      return LogRequest(
        id: json?['id'] as int?,
        logRequest: json?['logRequest'] as String?,
        logResponse: json?['logResponse'] as String?,
        typeRequest: json?['typeRequest'] as String?,
        statusRequest: json?['statusRequest'] as StatusRequest,
        dateCreateRequest: json?['dateCreateRequest'] as String?,
        dateCreateResponse: json?['dateCreateResponse'] as String?,
      );
    }

    //----------create methode toJson
    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'logRequest': logRequest,
        'logResponse': logResponse,
        'typeRequest': typeRequest,
        'statusRequest': statusRequest,
        'dateCreateRequest': dateCreateRequest,
        'dateCreateResponse': dateCreateResponse,
      };
    }

    //----------create methode fromString
    factory LogRequest.fromString(String jsonString) {
      return LogRequest.fromJson(json.decode(jsonString));
    }


    //----------create methode toString
    String toString() {
      return json.encode(toJson());
    }








}