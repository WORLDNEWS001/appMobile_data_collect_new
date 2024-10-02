

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/ViewNewEnqueteRecord.dart';
import 'package:secondtest/controller/ControllerEnquette/ControllerEnquette.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/api_network_request/accident/list_accident_request.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/list_accident_provider/data_list_accident_provider.dart';
import 'package:secondtest/model/provider/providerUtils.dart';
import 'package:secondtest/services/enquete/edit_enquete/MethodEditEnquete.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';
import 'package:secondtest/widgets/listDataDisplay/listEnqueteEnCour.dart';
import 'package:secondtest/widgets/listDataDisplay/listEnqueteCloture.dart';
import 'package:secondtest/widgets/listDataDisplay/listEnqueteAnnuler.dart';
import 'package:flutter/material.dart';


import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/authentificator/requestAPI.dart';
import 'package:http/http.dart' as http;
import 'package:secondtest/GlobalConstantData.dart';

//*******screen/testScriptProjet/


//import 'package:secondtest/screen/testScriptProjetCd/newEnqueteCallapse.dart';

import 'package:secondtest/screen/testScriptProjetCd/testListVictime.dart';
import 'package:secondtest/screen/testScriptProjetCd/testListAlertAccident.dart';
import 'package:secondtest/widgets/listDataDisplay/listEnqueteParGravite.dart';


//***************************************//**********************//





class listAccident  extends StatefulWidget {
  const listAccident ({Key? key}) : super(key: key);

  @override
  State<listAccident> createState() => _listAccidentState();
}

class _listAccidentState extends State<listAccident> {
  int _buttonIndex = 0;

  int nbr_enquete = 0;

  List<dynamic> listAccidentWidgets =[



    enqueteEnCour(),
    //---- good

    ListEnqueteParGravite(),
    // ---- good

    listAlertAccident(),
    // ---- good

    enqueteEnCour(),
    // ---- good

    //enqueteCloturer(),

    //enqueteAnnuler(),

    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
     // return newEnqueteRecord();
    // })),

    //enqueteEnCour(),

    //genere moi un code qui va me permettre de d'afficher un dialog avec deux bouton d'option oui ou non et une icon au dessus du dialog.
    
    


  ] ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // -------- Script test connexion --------------//
    GlobalMethod.listenToInternetConnection(context);
    //-----------------------------------------------

    //SystemChrome.setPreferredOrientations([DeviceOrientation.values.first, DeviceOrientation.values.last]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    context.read<DataListAccidentProvider>().UpdateDataAccidentListProvider();
    Logger().e(
        "***************** // INIT STATE PAGE LIST ACCIDENT // *****************");
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    nbr_enquete=context.watch<DataListAccidentProvider>().nbrEnqueteDataProvider;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //SystemChrome.setPreferredOrientations([DeviceOrientation.values.first, DeviceOrientation.values.last]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('DOSER',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            ),
            //-- contruire un widget de determiner si l'utilisateur est en ligne ou pas , couleur vert si enligne et rouge si hors ligne
            SizedBox(
              width: 10,
            ),

            ...(context.watch<ProviderUtils>().ProviderOnConnection == true)
                ? [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        //-- ajouter l'ombre
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromRGBO(12, 44, 0, 0.5019607843137255),
                            spreadRadius: 3,
                            blurRadius: 0.8,
                            offset:
                                Offset(0, 0.2), // changes position of shadow
                          ),
                        ],
                        //--- ajouter un effet de transition
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.greenAccent,
                            Colors.green,
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '(En Ligne)',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                : [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(44, 0, 0, 0.5019607843137255),
                            spreadRadius: 2,
                            blurRadius: 0.2,
                            offset:
                                Offset(0, 0.2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '(Hors Ligne)',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
          ],
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Text(
              'Actualiser',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Card(
            color: Colors.blue[300],
            elevation: 10,
            margin: EdgeInsets.all(8),
            child:IconButton(
              icon: Icon(Icons.update_sharp),
              onPressed: () async {
                // Action lorsque l'icône de recherche est pressée.

                context.read<DataListAccidentProvider>().UpdateDataAccidentListProvider();



                //----- testing Script----//
                    //-- request direct -- **********
                    // GetEnqueteRequestDio(id_enquete: 291);

                //-- request direct transforme result to Enquete Data -- **********
                //MethodEditEnquete().GetDataEnqueteWithIdRequest(context: context,id: 289);

                //---End testing Script----//

              },
            ),
          )



        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Police',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return enqueteCloturer();
                }));
              },
              leading: Icon(Icons.dock_sharp),
              title: Text('Pv Enquêtes'),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return enqueteAnnuler();
                }));
              },
              leading: Icon(Icons.cancel_rounded),
              title: Text('Enquêtes Annuler'),
            ),


            ListTile(

              leading: Icon(Icons.settings),
              title: Text('Paramettres'),
            ),
          ],
        ),
      ),
        body:Container(
          color: Colors.blue[50],
          child: Padding(
            padding: EdgeInsets.only(top:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:15),
                  child: Text(
                     listAccidentWidgets[_buttonIndex].TextTitle(),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),

                SizedBox(height: 5,),
                Container(
                  alignment: Alignment.center,

                  child: Card(

                    color: Colors.blue[50],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Wrap(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        runSpacing: 5,
                        spacing: 0,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.spaceEvenly,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children:<Widget> [
                          InkWell(
                            onTap: (){
                              print("object");
                              setState(() {
                                _buttonIndex =0;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _buttonIndex ==0  ? Colors.blue[300] : Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    //--- add widget image icon
                                    Image.asset(
                                      'assets/icon_doser/enquete.png',
                                      width: _buttonIndex == 0
                                          ? 35
                                          : 25,
                                    ),

                                    Text(
                                      "$nbr_enquete",
                                      style: TextStyle(
                                        fontSize: _buttonIndex == 0
                                            ? 20
                                            : 15,
                                        fontWeight: FontWeight.bold,
                                        color: _buttonIndex == 0  ? Colors.white : Colors.black38,
                                      ),
                                    ),
                                    Text(
                                      "Enquête(s)",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: _buttonIndex == 0  ? Colors.white : Colors.black38,
                                      ),
                                    ),
                                  ],
                                )


                            ),
                          ),
                          InkWell(
                            onTap: (){
                              print("object");
                              setState(() {
                                _buttonIndex =1;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _buttonIndex ==1  ? Colors.blue[300] : Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[

                                  //--- add widget image icon
                                  Image.asset(
                                      'assets/icon_doser/enqueteParGraviter.png',
                                    width: _buttonIndex == 1
                                        ? 35
                                        : 25,
                                  ),


                                  //Icon(Icons.st.),
                                  Text(
                                    "Enquête(s) par\n Gravité",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: _buttonIndex == 1
                                          ? Colors.white
                                          : Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              print("object");
                              setState(() {
                                _buttonIndex =2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _buttonIndex == 2
                                    ? Colors.blue[300]
                                    : Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  //--- add widget image icon
                                  Image.asset(
                                    'assets/icon_doser/alert.png',
                                    width: _buttonIndex == 2
                                        ? 35
                                        : 25,
                                  ),
                                  Text(
                                    "04",
                                    style: TextStyle(
                                      fontSize: _buttonIndex == 2
                                          ? 20
                                          : 15,
                                      fontWeight: FontWeight.bold,
                                      color: _buttonIndex == 2
                                          ? Colors.white
                                          : Colors.black38,
                                    ),
                                  ),
                                  Text(
                                    "Alert Accident",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: _buttonIndex == 2
                                          ? Colors.white
                                          : Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              print("object");
                              setState(() {
                                _buttonIndex =3;
                              });

                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                //return newEnqueteRecord();
                                return ControllerEnquete();
                                //return ViewNewEnqueteRecord();
                              }));

                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _buttonIndex == 3
                                    ? Colors.blue[300]
                                    : Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[

                                  Icon(Icons.add_circle_outline_rounded,
                                    size: _buttonIndex == 3
                                        ? 35
                                        : 25,
                                    color: _buttonIndex == 3
                                        ? Colors.white
                                        : Colors.black38,),
                                  Text(
                                    "Nouvelle",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: _buttonIndex == 3
                                          ? Colors.white
                                          : Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ) ,
                ),
                SizedBox(
                  height: 10,
                ),

                Expanded(
                  child:  listAccidentWidgets[_buttonIndex],
                )
              ],
            ),
          ),
        ),

    );








  }
}

