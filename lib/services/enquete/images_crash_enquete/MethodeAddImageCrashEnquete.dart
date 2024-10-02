import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/controller/ControllerEnquette/ControllerEnquette.dart';
import 'package:secondtest/model/api_network_request/crash_image/RequestAddImageCrash.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Images.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';

class MethodeAddImageCrashEnquete {
  Future<Images?> AddImageCrash(
      {required BuildContext context, required String? pathImageCrash}) async {
    // get data enquete with id

    context
        .read<ProviderColleteDataEnquete>()
        .refreshProviderCollecteDataEnquete();

    Map<String, dynamic>? resultRequest =
        await AddImageCrashRequestDio(pathImageString: pathImageCrash!);

    if (resultRequest == null) {
    } else {
      Images imagesCrashAdding = Images.fromJson(resultRequest["data"]);

      Logger().w(
          "\n\n\n\n\n\n\n\n object Images crash ADD -- instance  Images  :: \n\n $imagesCrashAdding \n\n");

      // print("\n\n\n-------------- imagesCrashAdding : $imagesCrashAdding \n\n\n");

      return imagesCrashAdding;

      //context.read<ProviderColleteDataEnquete>().data_enq_ProviderPickImageDataCrashLocal?.listImagesSend?.add(imagesCrashAdding);
    }
  }
}
