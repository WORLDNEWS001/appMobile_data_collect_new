import 'dart:convert';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/View/Formulaires_Enquete/View_Dialog/detail_view_dialog/detail_view_dialog_objet.dart';
import 'package:secondtest/authentificator/request_Token.dart';
import 'package:secondtest/controller/ControllerManagerPerson/ControllerAddPerson.dart';
import 'package:secondtest/controller/ControllerManagerVehicule/ControllerAddVehicule.dart';
import 'package:secondtest/model/Class_setting/role.dart';
import 'package:secondtest/model/Class_setting/user.dart';
import 'package:secondtest/model/api_network_request/accident/list_accident_request.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/list_accident_provider/data_list_accident_provider.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';
import 'package:secondtest/widgets/listDataDisplay/listEnqueteEnCour.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordRoad.dart';
//import 'package:secondtest/widgets/recordNewEnquete_test_old/widgetFormNewEnquete.dart';
//import 'package:secondtest/widgets/recordRoad.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordAccidentInfo.dart';
//import 'package:secondtest/widgets/recordNewEnquete/brouillons/recordInfoAccidentTest_CallBack.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordCar.dart';

import 'package:secondtest/widgets/recordNewEnquete/recordPersonAccidente.dart';





var GlobalEndStep=3;
var Validation_after_traitement = 2; // si egale 1 alors toute les donnee des formulaires sont corectement saisit si non c'est 2


class ViewNewEnqueteRecord extends StatefulWidget {

  final EnquetteData? enquetteData;
  bool isConsult;
  final Function() createNewEnquete;
  final Function() editEnquete;
  //--ajouter attibut function validateFormEnquete qui retourne un int
  final Future<int> Function()? validateFormEnquete;


   ViewNewEnqueteRecord({
    Key? key,
    required this.enquetteData,
    required this.createNewEnquete,
    required this.editEnquete,
    this.validateFormEnquete,
    this.isConsult = false,
  }) : super(key: key);

  @override
  State<ViewNewEnqueteRecord> createState() => _ViewNewEnqueteRecordState();
}


class _ViewNewEnqueteRecordState extends State<ViewNewEnqueteRecord> {


  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    print("initiation de la page new enquette step wizard terminer ----");
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      setState(() {

      });
    });

  }

  //myRecordCarCrash.someAction();

  void updateCurrentStep(int step) {
    setState(() {
      currentStep = step;
    });

  }
  void onStepContinue() {
    setState(() {
      if (currentStep < 3) {
        currentStep += 1;
      }
    });
  }
  void onStepCancel() {

    setState(() {
      if (currentStep > 0) {
        currentStep -= 1;
      }else{
        currentStep = 0;
        //--faire une navigation pop
        Navigator.pop(context);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => listAccident()),
        // );

      }
    });

  }


  void formCreateNewCarCrash() {
    print("je suis dans la fonction somme action du child de record New Car ");
    Navigator.push(
      context,
      MaterialPageRoute(
        //builder: (context) => RecordNewCar(),
        builder: (context) => ControllerAddVehicule(isConsult: widget.isConsult,),
      ),
    );
  }

  void formCreateNewPersonCrash() {
    print(
        "je suis dans la fonction somme action du child de record New Person ");

    if (currentStep == 3) {
      int? idEnquetteEnCour = context
          .read<ProviderColleteDataEnquete>()
          .DataFormEnquete
          ?.id;
     /* if (idEnquetteEnCour == null || idEnquetteEnCour == 0) {
        print("je suis dans le onStepContinue de l'ajout d'une personne ");
        String MessageDisplays = "Veuillez Declarer l'accident avant d'ajouter un accidenté pendant la modification de l'enquête";
         showAnimatedDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return dialogWidCust(context,contentText: MessageDisplays);
          },
          duration: Duration(milliseconds: 500),
          animationType: DialogTransitionType.slideFromBottom,
          curve: Curves.fastOutSlowIn,
        );

      } else { */
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ControllerAddPerson(isConsult: widget.isConsult,),
          ),
        );
     // }
    }
  }



  void onStepFinal() async {


    print(" \n\n\n\n +++++++++++++++ Creation Accident +++++++++++++++ \n\n");

    //------- Update All data in instance EnqueteData in provider data collecte
    context.read<ProviderColleteDataEnquete>().Update_data_enq;


    //----- verifier si validateFormEnquete est null
    if(widget.validateFormEnquete == null){
      print("la fonction validateFormEnquete est null");
    }else{
      print("la fonction validateFormEnquete n'est pas null");
      int resultStepValidateForm = await widget.validateFormEnquete!();
      print("resultStepValidateForm : ${resultStepValidateForm}");

      if(resultStepValidateForm !=4){

        setState(() {
          currentStep = resultStepValidateForm;
        });

      }else{

        //------------ CONFIRM SCRIPT -----------ree

        widget.createNewEnquete().then((value) {
          setState(() {
            print(" \n\n\n\n +++++++++++++++ FIN Creation Accident +++++++++++++++ \n\n");
          });
        });


      }
    }
  }


















  @override
  Widget build(BuildContext context) {


    //----------------- DImentionnement
    var heightScreen =MediaQuery.of(context).size.height;
    var widthScreen =MediaQuery.of(context).size.width;
    var surfaceScreen = heightScreen * widthScreen;
    print("taille ecran ; hauteur : ${heightScreen} px ,  Largeur : ${widthScreen} px Et la Surface Global est de : ${surfaceScreen}  px");
    //-------Fin Test de dimentionnement --------

    //----------phone android
    //309248.0  px ----- vertical position
    //300032.0  px ----- horizontal position
    //---------phone Tablette
    //555600.0  px ----- vertical position
    //543840.0  px ----- horizontal position




    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle Enquête"),
        centerTitle: true,
      ),
      body: Center(
        //width: 900,
        //height: 1000,
        //padding: EdgeInsets.all(5),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: (){

            final isLastStep = currentStep == getSteps().length - 1;
            if(isLastStep){
              print("Complete step record Road");
              /// Send data in server

            }else{

              setState(() {
                currentStep += 1;
              });
            }


          },
          onStepCancel: (){
            currentStep==0 ? null: setState(() => currentStep -=1 );
            print(currentStep);
            //currentStep = 2;

          },
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
              print(currentStep);
            });
          },



          controlsBuilder: (BuildContext context, ControlsDetails? controlsDetails) {




            return checkPermission(user, "create_accident")
                ?
            Container()
                :
            SizedBox.shrink();


            //return SizedBox.shrink();
          },

        ),
      ),

      floatingActionButton:  (currentStep == 2 || currentStep == 3) ? FloatingActionButton(
        onPressed: widget.isConsult ? null :
            () {
          // Action à effectuer lors du clic sur le FloatingActionButton
          if(currentStep == 2 ){
            print("je suis dans le floatingActionButton de l'ajout d'un Vehicule ");
            formCreateNewCarCrash();
          }
          else if(currentStep == 3){
            print("je suis dans le floatingActionButton de l'ajout d'un accidenté ");
            formCreateNewPersonCrash();
          }
        },
        child: (currentStep == 2 )
            ?
        Icon(Icons.car_crash_rounded)
            :
        Icon(Icons.person_add_alt_1_outlined),
      ) : null,

      bottomNavigationBar: BottomAppBar(
          child:
          (currentStep != GlobalEndStep)
              ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              ElevatedButton.icon(
                onPressed: onStepCancel,
                icon: Icon(Icons.arrow_circle_left_outlined,
                    size: 50),
                label: Text('Retour'),
              ),
              ElevatedButton.icon(
                onPressed: onStepContinue,
                label: Text('Continuer'),
                //label: Text('Continuer'),
                //style: Colors(),
                icon: Icon(Icons.arrow_circle_right_outlined, size: 50),
              ),
            ],
          )
              :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              ElevatedButton.icon(
                onPressed: onStepCancel,
                icon: Icon(Icons.arrow_circle_left_outlined,
                    size: 50),
                label: Text('Retour'),
              ),
              ElevatedButton.icon(
                onPressed: widget.isConsult ? null
                    :
                    () async {
                   onStepFinal();
                },
                label: Text('Terminer'),
                style: ElevatedButton.styleFrom(
                  primary: Validation_after_traitement == 1 ? Colors.green : Colors.green, // Changer la couleur d'arrière-plan
                ),
                icon: Icon(Icons.gpp_good, size: 50),
              ),
            ],
          )

      ),
    );


  }


  List<Step> getSteps() => [
    Step(
      isActive: currentStep >=0,
      title: Text("Route",
        style: TextStyle(
            fontSize: (currentStep==0)? MediaQuery.of(context).size.width * 0.0275 : MediaQuery.of(context).size.width * 0.025,
            fontWeight: (currentStep==0)?FontWeight.w700 : FontWeight.w300,
            color: (currentStep==0)
                ?Colors.blue
                : Colors.black
        ),
      ),
      content: recordNewRoad(
        onStepUpdated: updateCurrentStep,
        isConsult: widget.isConsult,
      ),
    ),
    Step(
      isActive: currentStep >=1,
      title: Text('Accident',
        style: TextStyle(
            fontSize: (currentStep==1)? MediaQuery.of(context).size.width * 0.0275 : MediaQuery.of(context).size.width * 0.025,
            fontWeight: (currentStep==1)?FontWeight.w700 : FontWeight.w300,
            color: (currentStep==1)
                ?Colors.blue
                :Colors.black
        ),
      ),
      content: recordAccidentInfo(
        onStepUpdated: updateCurrentStep,
        isConsult: widget.isConsult,
      ),
    ),
    Step(
      isActive: currentStep >=2,
      title: Text('Vehicules',
        style: TextStyle(
            fontSize: (currentStep==2)? MediaQuery.of(context).size.width * 0.0275 : MediaQuery.of(context).size.width * 0.025,
            fontWeight: (currentStep==2)?FontWeight.w700 : FontWeight.w300,
            color: (currentStep==2)
                ?Colors.blue
                : Colors.black
        ),
      ),
      content: Container(
        height: (MediaQuery.of(context).size.height)-230,
        child: recordCarCrash(
          onStepUpdated: updateCurrentStep,
          isConsult: widget.isConsult,
        ),
      ),

    ),

    Step(
      isActive: currentStep >=3,
      title: Text('Accidentés',
        style: TextStyle(
            fontSize: (currentStep==3)? MediaQuery.of(context).size.width * 0.0275 : MediaQuery.of(context).size.width * 0.025,
            fontWeight: (currentStep==3)?FontWeight.w700 : FontWeight.w300,
            color: (currentStep==3)
                ?Colors.blue
                : Colors.black
        ),
      ),
      content:Container(
        height: (MediaQuery.of(context).size.height)-230,
        child: RecordPersonAccidente(
          onStepUpdated: updateCurrentStep,
          isConsult: widget.isConsult,
        ),
      ),
    ),

    // Ajoutez les autres étapes ici
  ];







  Widget dialogWidCust(BuildContext context, {required String contentText}) {
    return CleanDialog(
      title: 'Attention',
      content: Text(
        contentText,
        textAlign: TextAlign.center,
        style:TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15
        ),
      ),

      backgroundColor:  Colors.blue,
      titleTextStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      actions: [
        CleanDialogActionButtons(
          actionTitle: 'Cancel',
          onPressed: () => Navigator.pop(context),
        ),
        CleanDialogActionButtons(
          actionTitle: 'Completez',
          textColor: const Color(0XFF27ae61),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }



}











