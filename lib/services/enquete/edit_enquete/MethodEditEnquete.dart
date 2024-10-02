




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/controller/ControllerEnquette/ControllerEnquette.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';

class MethodEditEnquete{
  
  
  
  GetDataEnqueteWithIdRequest({required BuildContext context, required int? id}) async {
    // get data enquete with id
    
    Map<String, dynamic>? resultRequest = await GetEnqueteRequestDio(id_enquete: id);

    if(resultRequest == null){
      return;
    }else{

      EnquetteData? enquetteData = EnquetteData.fromJsonRequest(resultRequest["data"], context);
      Logger().w("\n\n\n\n\n\n\n\n object enquetteData -- instance  EnquetteData  :: \n\n ${enquetteData} \n\n");
      context.read<ProviderColleteDataEnquete>().UpdateProvidersCollecteByDataEnquete(enquetteData);
    }

  }

}


