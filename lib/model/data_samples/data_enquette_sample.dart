




import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteResp.dart';

Map<String, dynamic> SampleDataResquestResult_oneEnquette  = {
  "id": 121,
  "accidentDate": "30/05/2023",
  "accidentTime": "12:34",
  "municipality": "Mbonge",
  "latitude": 60.64447411232757,
  "longitude": -100.67029499796332,
  "place": "3",
  "road": null,
  "roadType": "Inconnu",
  "roadCategory": "Art\u00e8re principale",
  "speedLimit": 0,
  "block": 3,
  "roadState": 8,
  "roadIntersection": 8,
  "roadTrafficControl": 7,
  "virage": 4,
  "roadSlopSection": 2,
  "accidentType": 9,
  "impactType": 1,
  "climaticCondition": 8,
  "brightnessCondition": 6,
  "accidentSeverity": "Mortel",
  "vehicules": [
    {
      "id": 213,
      "vehicleAccidentNumber": 1,
      "plate": "LT12345",
      "chassis": null,
      "vehicleId": 212,
      "type": 6,
      "brand": 13,
      "model": 23,
      "fabricationYear": 2,
      "cylinderCapacity": 2,
      "specialFunction": 6,
      "vehicleAction": 13,
      "vehicleImages": [
        {
          "path": "http://192.168.43.193:8079/public/images/accident/crash/CRASH20230529121224090.png",
          "name": "CRASH20230529121224090.png"
        },
        {
          "path": "http://192.168.43.193:8079/public/images/accident/crash/CRASH20230529121228463.png",
          "name": "CRASH20230529121228463.png"
        }
      ]
    }
  ],
  "persons": [
    {
      "id": 262,
      "firstName": "ddd",
      "lastName": "EKKK",
      "cni": null,
      "telephone": null,
      "personAccidentNumber": 1,
      "vehicleAccidentNumber": 1,
      "vehicleLinkedPedestrian": 1,
      "birthDate": "03/05/2023",
      "gender": 3,
      "roadType": 1,
      "range": 1,
      "place": 1,
      "traumaSeverity": 5,
      "wearingHelmet": 3,
      "occupantRestraintSystem": 9,
      "personAction": 6,
      "alcoholConsumption": 4,
      "testStatus": 1,
      "testType": 2,
      "testResult": 2,
      "drugUse": 5,
      "drivingLicenceYear": null,
      "care": 0,
      "personId": 434,
      "images": [
        {
          "path": "http://192.168.43.193:8079/public/images/accident/crash/CRASH20230529121224090.png",
          "name": "CRASH20230529121224090.png"
        },
        {
          "path": "http://192.168.43.193:8079/public/images/accident/crash/CRASH20230529121228463.png",
          "name": "CRASH20230529121228463.png"
        }
      ],
      "profession": 1
    },
    {
      "id": 263,
      "firstName": "uuuuu",
      "lastName": "DDDDD",
      "cni": null,
      "telephone": null,
      "personAccidentNumber": 2,
      "vehicleAccidentNumber": 1,
      "vehicleLinkedPedestrian": 1,
      "birthDate": null,
      "gender": 3,
      "roadType": 2,
      "range": 5,
      "place": 6,
      "traumaSeverity": 5,
      "wearingHelmet": 3,
      "occupantRestraintSystem": 9,
      "personAction": 6,
      "alcoholConsumption": 4,
      "testStatus": 1,
      "testType": 2,
      "testResult": 2,
      "drugUse": 5,
      "drivingLicenceYear": null,
      "care": 0,
      "personId": 435,
      "images": [
        {
          "path": "http://192.168.43.193:8079/public/images/accident/crash/CRASH20230529121224090.png",
          "name": "CRASH20230529121224090.png"
        },
        {
          "path": "http://192.168.43.193:8079/public/images/accident/crash/CRASH20230529121228463.png",
          "name": "CRASH20230529121228463.png"
        }
      ],
      "profession": 1
    }
  ],
  "city": "Ed\u00e9a",
  "status": "READY",
  "causes": [
    {"id": 2, "name": "Problème mécanique"},
    {"id": 4, "name": "Téléphone au volant"}
  ],
  "crashImages": [
    {
      "path": "http://192.168.43.193:8079/public/images/accident/crash/CRASH20230529121224090.png",
      "name": "CRASH20230529121224090.png"
    },
    {
      "path": "http://192.168.43.193:8079/public/images/accident/crash/CRASH20230529121228463.png",
      "name": "CRASH20230529121228463.png"
    }
  ],
  "drawing": {
    "name": "DRAWING20230612101436935",
    "path": "http://192.168.43.193:8079/public/images/accident/drawing/DRAWING20230612101436935"
  }
};






Map<String, dynamic> SampleDataSendToEdit_oneEnquette_old ={
  "id": 290,
  "accidentDate": "15/05/2024",
  "accidentTime": "12:03",
  "municipality": 26,
  "latitude": 62.684897762832826,
  "longitude": -22.63222271681186,
  "place": "hhhhh",
  "road": 0,
  "roadType": 8,
  "roadCategory": 2,
  "speedLimit": 0,
  "block": 3,
  "roadState": 8,
  "roadIntersection": 8,
  "roadTrafficControl": 7,
  "virage": 4,
  "roadSlopSection": 2,
  "accidentType": 2,
  "impactType": 1,
  "climaticCondition": 8,
  "brightnessCondition": 5,
  "accidentSeverity": 1,
  "vehicules": [
    {
      "type": 2,
      "model": 20,
      "brand": 9,
      "specialFunction": 10,
      "vehicleAction": 9,
      "fabricationYear": 1980,
      "cylinderCapacity": 8,
      "vehicleAccidentNumber": 1,
      "plate": "45125",
      "vehicleId": 0
    },
    {
      "type": 9,
      "model": 20,
      "brand": 7,
      "specialFunction": 11,
      "vehicleAction": 10,
      "fabricationYear": 1955,
      "cylinderCapacity": 2,
      "vehicleAccidentNumber": 2,
      "plate": "78445",
      "vehicleId": 0
    }
  ],
  "persons": [
    {
      "roadType": 2,
      "place": 3,
      "range": 3,
      "wearingHelmet": 2,
      "occupantRestraintSystem": 5,
      "testStatus": 1,
      "testType": 2,
      "testResult": 1,
      "traumaSeverity": 3,
      "alcoholConsumption": 2,
      "gender": 2,
      "drugUse": 3,
      "profession": 1,
      "personAction": 3,
      "personAccidentNumber": 1,
      "vehicleLinkedPedestrian": 1,
      "vehicleAccidentNumber": 1,
      "firstName": "JOEL1 TEST",
      "lastName": "JOEL PRENOM 1 TEST",
      "birthDate": "14/05/2024",
      "drivingLicenceYear": "16/05/2024",
      "id": 0,
      "care": 0
    },
    {
      "wearingHelmet": 2,
      "roadType": 3,
      "occupantRestraintSystem": 5,
      "testStatus": 2,
      "testType": 2,
      "testResult": 1,
      "traumaSeverity": 3,
      "alcoholConsumption": 2,
      "gender": 1,
      "drugUse": 2,
      "profession": 1,
      "personAction": 3,
      "place": 2,
      "range": 2,
      "personAccidentNumber": 2,
      "vehicleLinkedPedestrian": 1,
      "vehicleAccidentNumber": 1,
      "firstName": "test 2 joel",
      "lastName": "TEST2  PRENOM",
      "birthDate": "08/05/2024",
      "drivingLicenceYear": "10/05/2024",
      "id": 0,
      "care": 0
    },
    {
      "wearingHelmet": 3,
      "roadType": 3,
      "occupantRestraintSystem": 5,
      "testStatus": 2,
      "testType": 3,
      "testResult": 1,
      "traumaSeverity": 3,
      "alcoholConsumption": 2,
      "gender": 1,
      "drugUse": 1,
      "profession": 1,
      "personAction": 3,
      "place": 3,
      "range": 2,
      "personAccidentNumber": 3,
      "vehicleLinkedPedestrian": 1,
      "vehicleAccidentNumber": 1,
      "firstName": "test 3 ",
      "lastName": "NAME TEST 3",
      "birthDate": "08/05/2024",
      "drivingLicenceYear": "18/05/2024",
      "id": 0,
      "care": 0
    }
  ],
  "city": 16,
  "status": "OPENED",
  "causes": [],
  "crashImages": [],
  "drawing": {
    "name": null,
    "path": "http://51.195.11.202:8099/public/images/accident/crash/null"
  }
};




Map<String, dynamic> TakeDataOne_Enquette ={
  "id": 180,
  "accidentDate": "15/05/2024",
  "accidentTime": "12:03",
  "municipality": 26,
  "latitude": 62.684897762832826,
  "longitude": -22.63222271681186,
  "place": "hhhhh",
  "road": null,
  "roadType": 8,
  "roadCategory": 2,
  "speedLimit": 0,
  "block": 3,
  "roadState": 8,
  "roadIntersection": 8,
  "roadTrafficControl": 7,
  "virage": 4,
  "roadSlopSection": 2,
  "accidentType": 2,
  "impactType": 1,
  "climaticCondition": 8,
  "brightnessCondition": 5,
  "accidentSeverity": 1,
  "vehicules": [
    {
      "id": 397,
      "vehicleAccidentNumber": 1,
      "plate": "45125",
      "chassis": null,
      "vehicleId": 371,
      "type": 10,
      "brand": 9,
      "model": 20,
      "fabricationYear": 1980,
      "cylinderCapacity": 8,
      "specialFunction": 10,
      "vehicleAction": 9,
      "vehicleImages": []
    },
    {
      "id": 398,
      "vehicleAccidentNumber": 2,
      "plate": "78445",
      "chassis": null,
      "vehicleId": 372,
      "type": 11,
      "brand": 7,
      "model": 20,
      "fabricationYear": 1955,
      "cylinderCapacity": 2,
      "specialFunction": 11,
      "vehicleAction": 10,
      "vehicleImages": []
    }
  ],
  "persons": [
    {
      "id": 452,
      "firstName": "JOEL1 TEST",
      "lastName": "JOEL PRENOM 1 TEST",
      "cni": null,
      "telephone": null,
      "personAccidentNumber": 1,
      "vehicleAccidentNumber": 1,
      "vehicleLinkedPedestrian": 1,
      "birthDate": "14/05/2024",
      "gender": 2,
      "roadType": 2,
      "range": 3,
      "place": 3,
      "traumaSeverity": 3,
      "wearingHelmet": 2,
      "occupantRestraintSystem": 5,
      "personAction": 3,
      "alcoholConsumption": 2,
      "testStatus": 1,
      "testType": 1,
      "testResult": 1,
      "drugUse": 3,
      "drivingLicenceYear": "16/05/2024",
      "care": 239,
      "personId": 657,
      "images": [],
      "profession": 1
    },
    {
      "id": 453,
      "firstName": "test 2 joel",
      "lastName": "TEST2  PRENOM",
      "cni": null,
      "telephone": null,
      "personAccidentNumber": 2,
      "vehicleAccidentNumber": 1,
      "vehicleLinkedPedestrian": 1,
      "birthDate": "08/05/2024",
      "gender": 1,
      "roadType": 3,
      "range": 2,
      "place": 2,
      "traumaSeverity": 3,
      "wearingHelmet": 2,
      "occupantRestraintSystem": 5,
      "personAction": 3,
      "alcoholConsumption": 2,
      "testStatus": 2,
      "testType": 1,
      "testResult": 1,
      "drugUse": 2,
      "drivingLicenceYear": "10/05/2024",
      "care": 94,
      "personId": 658,
      "images": [],
      "profession": 1
    },
    {
      "id": 454,
      "firstName": "test 3 ",
      "lastName": "NAME TEST 3",
      "cni": null,
      "telephone": null,
      "personAccidentNumber": 3,
      "vehicleAccidentNumber": 1,
      "vehicleLinkedPedestrian": 1,
      "birthDate": "08/05/2024",
      "gender": 1,
      "roadType": 3,
      "range": 2,
      "place": 3,
      "traumaSeverity": 3,
      "wearingHelmet": 3,
      "occupantRestraintSystem": 5,
      "personAction": 3,
      "alcoholConsumption": 2,
      "testStatus": 2,
      "testType": 1,
      "testResult": 1,
      "drugUse": 1,
      "drivingLicenceYear": "18/05/2024",
      "care": 54,
      "personId": 659,
      "images": [],
      "profession": 1
    }
  ],
  "city": 16,
  "status": "OPENED",
  "causes": [],
  "crashImages": [
    {
      "path": "http://51.195.11.202:8099/public/images/accident/crash/CRASH20240527135425566.png",
      "name": "CRASH20240527135425566.png"
    },
    {
      "path": "http://51.195.11.202:8099/public/images/accident/crash/CRASH20240527135444617.png",
      "name": "CRASH20240527135444617.png"
    }
  ],
  "drawing": {
    "name": null,
    "path": "http://51.195.11.202:8099/public/images/accident/crash/null"
  }
};




class TestDataEnquette{



  void getEnquetteRequestTest(){

    EnquetteRequest? enquetteDataRequestTest = EnquetteRequest.fromJson(SampleDataResquestResult_oneEnquette);

    print("----data enquette data test ::: id = ${enquetteDataRequestTest.id} ---"
        "----data enquette Request test ::: accidentDate = ${enquetteDataRequestTest.accidentDate} ---"
        "----data enquette Request test ::: accidentTime = ${enquetteDataRequestTest.accidentTime} ---"
        "----data enquette Request test ::: municipality = ${enquetteDataRequestTest.municipality} ---"
        "----data enquette Request test ::: latitude = ${enquetteDataRequestTest.latitude} ---"
        "----data enquette Request test ::: longitude = ${enquetteDataRequestTest.longitude} ---"
        "----data enquette Request test ::: place = ${enquetteDataRequestTest.place} ---"
        "----data enquette Request test ::: roadType = ${enquetteDataRequestTest.roadType} --- "
        "----data enquette Request test ::: roadCategory = ${enquetteDataRequestTest.roadCategory} ---"
        "----data enquette Request test ::: speedLimit = ${enquetteDataRequestTest.speedLimit} ---");


    print("\n\n object enquetteDataRequestTest-- RESULT INSTANCE EnquetteRequest :: $enquetteDataRequestTest \n\n");

    print("\n\n object enquetteDataRequestTest ---- TOJSON :: ${enquetteDataRequestTest.toJson()} \n\n\n\n\n\n");
    //return enquetteDataTest;
  }



  void getEnquetteDataTest(BuildContext context ){

    //EnquetteData SampleDataSendToEdit_oneEnquette_inst= EnquetteData.fromJsonRequest(SampleDataSendToEdit_oneEnquette_old, context);
    EnquetteData SampleDataSendToEdit_oneEnquette_inst= EnquetteData.fromJsonRequest(TakeDataOne_Enquette, context);


    print("----data enquette data test ::: id = ${SampleDataSendToEdit_oneEnquette_inst.id} ---"
        "\n----data enquette data test ::: accidentDate = ${SampleDataSendToEdit_oneEnquette_inst.accidentDate} ---"
        "\n----data enquette data test ::: accidentTime = ${SampleDataSendToEdit_oneEnquette_inst.accidentTime} ---"
        "\n----data enquette data test ::: municipality = ${SampleDataSendToEdit_oneEnquette_inst.municipality} ---"
        "\n----data enquette data test ::: latitude = ${SampleDataSendToEdit_oneEnquette_inst.latitude} ---"
        "\n----data enquette data test ::: longitude = ${SampleDataSendToEdit_oneEnquette_inst.longitude} ---"
        "\n----data enquette data test ::: place = ${SampleDataSendToEdit_oneEnquette_inst.place} ---"
        "\n----data enquette data test ::: roadType = ${SampleDataSendToEdit_oneEnquette_inst.roadType} --- "
        "\n----data enquette data test ::: roadCategory = ${SampleDataSendToEdit_oneEnquette_inst.roadCategory} ---"
        "\n----data enquette data test ::: speedLimit = ${SampleDataSendToEdit_oneEnquette_inst.speedLimit} ---");


    print("\n\n Data person de instance person dans instance EnquetteData "
        "\n  ${SampleDataSendToEdit_oneEnquette_inst.persons?[1].traumaSeverity?.value } \n\n\n");

    Logger().w("\n\n\n\n\n\n\n\n object SampleDataSendToEdit_oneEnquette_inst -- instance  EnquetteData  :: \n\n $SampleDataSendToEdit_oneEnquette_inst \n\n");

    //print("\n\n\n\n\n\n object SampleDataSendToEdit_oneEnquette_inst  --methode toJson de EnquetteData ::\n\n ${SampleDataSendToEdit_oneEnquette_inst.toJson()} \n\n\n\n\n\n");
    //return enquetteDataTest;
  }




}