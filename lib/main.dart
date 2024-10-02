

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Auth/ViewLogin.dart';
import 'package:secondtest/View/Formulaires_Enquete/View_Dialog/show_one_show_dialog.dart';
import 'package:secondtest/controller/ControllerCroquis/ControllerCroquis.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Route/control_resp.dart';
import 'package:secondtest/model/data_samples/data_enquette_sample.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/create_pv_provider/ProviderCreatePv.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
import 'package:secondtest/model/provider/deposition_provider/depositionProvider.dart';
import 'package:secondtest/model/provider/list_accident_provider/data_list_accident_provider.dart';
import 'package:secondtest/model/provider/providerUtils.dart';
import 'package:secondtest/services/feature_drawing/drawing_room/presentation/ViewSignatureDraft.dart';
import 'View/Liste_Accident/Tile_One_Accident/Profil_Image_Accident.dart';
import 'model/provider/list_accident_provider/option_accident/type_option_provider.dart';
import 'screen/authentificateScreens/connexionScreen.dart';
import 'main.dart';
import 'main.dart';
import 'package:permission_handler/permission_handler.dart';




import 'services/feature_drawing/drawing_room/presentation/ViewCroquisDraft.dart';
import 'widgets/recordNewEnquete/recordCar.dart';

//***************screen/

import 'screen/accidentScreens/listAccident.dart';

//**********************************************//****************************//




//-----------------------------------------///////

import 'widgets/recordNewEnquete/test.dart';

import 'ressource/saveDataJson.dart';

//------------------------------------------

import 'authentificator/request_Token.dart';
import 'authentificator/requestAPI.dart';




//*******screen/testScriptProjet/

//import 'screen/testScriptProjetCd/newEnqueteCallapse.dart';

//***************************************//**********************//





//********* External Projet test *************//

import 'screen/brouillon_Time/testScript/test_sms_receive.dart'; //---good
//import 'screen/testScript/test_sms_receive2.dart';

//*************************************//****************************//


import 'package:secondtest/model/classData/modelDataEnquette.dart';


//*******screen/enquette/


//***************************************//**********************//


//----------------------test file


import 'package:secondtest/TestWidget.dart';

//-----------------------




Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized(); // Initialisation du binding de Flutter

  //testdata.exec();
//----------------------------------------------------------------------
  //runApp(SecondApp());

  runApp(
      MultiProvider(
        providers: [
      ChangeNotifierProvider(create: (_) => TypeOptionProvider()),
      ChangeNotifierProvider(create: (_) => DataListAccidentProvider()),
      ChangeNotifierProvider(create: (_) => DataOmsSelectProvider()),
      ChangeNotifierProvider(create: (_) => ProviderColleteDataEnquete()),
      ChangeNotifierProvider(create: (_) => ProviderUtils()),
      ChangeNotifierProvider(create: (_) => ProviderCreatePv()),
          ChangeNotifierProvider(create: (_) => ProviderDeposition()),
    ],
        child: MyApp(),
      )

  );
}

class MyApp extends StatelessWidget{


  bool activateUpdateData=true;



  @override
  Widget build(BuildContext context){

    WidgetsBinding.instance.addPostFrameCallback((_)  {
      Logger().e("+++++++++++ START EXECUTE BUILD  MYAPP  +++++++++");
      // -------- Script test connexion --------------//
      GlobalMethod.listenToInternetConnection(context);
      //-----------------------------------------------

      if (activateUpdateData) {
        //------------ TEST SCRIPT --------------//

        //EditEnqueteRequestDio(json_data_send: SampleDataSendToEdit_oneEnquette_old);

        //------ END TES SCRIPT --------------//

        context.read<DataOmsSelectProvider>().UpdateDataOmsSelectProvider(context: context).then((value) {
              /*
           DataOmsSelectProvider dataOmsSelectProvider=  context.read<DataOmsSelectProvider>();
           List<ControlResp> listControlResp = dataOmsSelectProvider.controlRespListSelect;
           Logger().e("\n\n\n\n+++++++++++ Afficher les données de  listControlResp recuperer::\n\n Get data by code :: ${dataOmsSelectProvider.getControlRespById(2)} -------- \n\n ${listControlResp}  +++++++++\n\n\n\n");
              */
        });
         //context.read<DataListAccidentProvider>().UpdateDataAccidentListProvider(context: context).then((val){
           //TestDataEnquette().getEnquetteDataTest(context);
           //TestDataEnquette().getEnquetteRequestTest();
        // });
        activateUpdateData=false;
      }


    });




    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),

      //home: FormScreen(),

      //home: testing(),

      //home: newEnqueteRecord(),


      //-----------
      //home: recordCarCrash(),

      //home: StepperPage(),

      //home: ParentScreen(),

       home: listAccident(),
        //home:  FlutterKeycloakExample('Flutter Keycloak Example'),

        //----home: OneShowDialog(),

      //home:

      //home: newEnqueteRecord(),

      //home: FormScreen(),


      //-************** home: ControllerCroquis(),
      //home: ViewCroquisDraft(),







      //****** external project ****//
      //home: MyWidget(),

      //-------home: TestWidget()
      //****************************



    );


  }
}

