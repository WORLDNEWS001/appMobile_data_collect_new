import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/ViewNewEnqueteRecord.dart';
import 'package:secondtest/View/Formulaires_Enquete/View_Dialog/detail_view_dialog/detail_view_dialog_objet.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/controller/ControllerManagerPerson/ControllerAddPerson.dart';
import 'package:secondtest/controller/ControllerManagerVehicule/ControllerAddVehicule.dart';
import 'package:secondtest/model/api_network_request/enquete/RequestCreateEnquete.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/EnquetteData.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/services/enquete/edit_enquete/MethodEditEnquete.dart';
import 'package:secondtest/widgets/general_widget/dialog/DialogBottomSheetType.dart';

class ControllerEnquete extends StatefulWidget {
  int? idEnquete;
  bool isConsult;
  ControllerEnquete({
    super.key,
    this.idEnquete,
    this.isConsult = false,
  });

  @override
  State<ControllerEnquete> createState() => _ControllerEnqueteState();
}

class _ControllerEnqueteState extends State<ControllerEnquete> {

 EnquetteData? enquetteData = EnquetteData();


 @override
  void initState() {
    // TODO: implement initState
   super.initState();
    //enquetteData = Pro

    //------------- RESET DATA IN FORM ENQUETTE LOAD ------------
    context.read<ProviderColleteDataEnquete>().resetDataForm();
    //------------- END RESET DATA IN FORM ENQUETTE LOAD

    if (widget.idEnquete != null) {
      MethodEditEnquete().GetDataEnqueteWithIdRequest(context: context, id: widget.idEnquete);
    }

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    enquetteData = context.watch<ProviderColleteDataEnquete>().DataFormEnquete;
  }


  @override
  Widget build(BuildContext context) {
    return ViewNewEnqueteRecord(
      enquetteData: enquetteData,
      createNewEnquete: createNewEnquete,
      editEnquete: editEnquete,
      validateFormEnquete: ValidateurDataEnquete,
      isConsult: widget.isConsult,
    );
  }





  //------------------ Script interne  to edit Enquette --------------









 //****************----------------- Create Enquete -----------------****************//

  Future<Map<String, dynamic>?> createNewEnquete() async {
   print("--------/////////---  Create New Enquette  ---/////////--------");

    EnquetteData? enquetteData=context.read<ProviderColleteDataEnquete>().DataFormEnquete;

   Map<String, dynamic>? resultRequest;
   if (widget.idEnquete != null) {
     enquetteData?.id = widget.idEnquete;
      MyDialogLoader.showLoadingDialog(
          context, "Modification de l'enquette en cour ");
      resultRequest =
          await enquetteData?.executeRequestEditEnquete(context: context).then((resultRequest) async {

            //----- attente de 1 miliseconde
            await Future.delayed(Duration(milliseconds: 1));

            MyDialogLoader.hideLoadingDialog(context);

            if(resultRequest?["success"] == true){
              functionToAlertEditSuccess();
            }else{
              functionToAlertError();
            }


            /*
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => listAccident()),
        );
        await Future.delayed(Duration(milliseconds: 1));

             */

        setState(() {
          print("Traitement data");
        });
      });

   }else{
     MyDialogLoader.showLoadingDialog(context, "Déclaration de l'enquette en cour ");

      resultRequest = await enquetteData?.executeRequestCreateEnquete(context: context).then((resultRequest) async {


        //----- attente de 1 miliseconde
        await Future.delayed(Duration(milliseconds: 1));

        MyDialogLoader.hideLoadingDialog(context);



        if(resultRequest?["success"] == true){
          print("\n\n\n Confirmation je suis a Success\n\n\n");
          functionToAlertSuccess();
        }else{
          print("\n\n\n Echec je suis a Error avec comme result success == ${resultRequest?["success"]}  \n\n\n");
          functionToAlertError();
        }





        setState(() {
          print("Traitement data");
        });
      });
    }



    print(
        " \n\n\n\n +++++++++++++++ FIN Creation Accident +++++++++++++++ \n\n\n\n");
    return resultRequest;
  }













  //****************----------------- Edit Enquete -----------------****************//


  editEnquete(){
    print("--------/////////---  Edit Enquette  ---/////////--------");


  }










  //----------------------  Validation Formulaire de l'enquette ----------------------


 Future<int> ValidateurDataEnquete() async {
   int StepReturnToComplete = 0;
   String? MessageDisplays = "";

   context.read<ProviderColleteDataEnquete>().UpdateDataFormEnquete();

   print("----------------- les donnees de l'enquete actives sont de : $enquetteData-----------------");

   //----- verification de la nullabilité de chaque attribut de l'enquete


   //-----------Verification des donnee de l'enquette ( Partie 0 (Step 0)  pour ressensement des donees de la route) -------------------

          if(enquetteData?.latitude == null || enquetteData?.latitude == "" || enquetteData?.longitude == null || enquetteData?.longitude == ""){

            MessageDisplays= "Veuillez renseigner les coordonnées de localisation GPS de l'accident";
            StepReturnToComplete = 0;

          }else if(enquetteData?.roadType == null ) {

              MessageDisplays= "Veuillez renseigner le type de route";
              StepReturnToComplete = 0;

          }else if(enquetteData?.roadState == null ) {

              MessageDisplays= "Veuillez renseigner l'etat de la route";
              StepReturnToComplete = 0;

          }else if(enquetteData?.roadSlopSection == null ) {

                MessageDisplays= "Veuillez renseigner la pente du tronçons de la route";
                StepReturnToComplete = 0;

          }else if(enquetteData?.roadTrafficControl == null ) {

                MessageDisplays= "Veuillez renseigner le controle de la circulation";
                StepReturnToComplete = 0;

          }else if(enquetteData?.roadCategory == null ) {

                  MessageDisplays= "Veuillez renseigner la categorie de la route";
                  StepReturnToComplete = 0;

          }else if(enquetteData?.block == null ) {

                  MessageDisplays= "Veuillez renseigner l'obstacle Routier ";
                  StepReturnToComplete = 0;

          }else if(enquetteData?.roadIntersection == null ) {

                    MessageDisplays= "Veuillez renseigner l'intersection de la route";
                    StepReturnToComplete = 0;

          }else if(enquetteData?.virage == null ) {

                      MessageDisplays= "Veuillez renseigner le type de virage";
                      StepReturnToComplete = 0;

          } else

  //-----------Verification des donnee de l'enquette ( Partie 1 (Step 1)  pour ressensement des donees des infos de l'accident) -------------------

          if(enquetteData?.accidentDate == null || enquetteData?.accidentDate=="") {

              MessageDisplays = "Veuillez renseigner la date de l'accident";
              StepReturnToComplete = 1;

          }else if(enquetteData?.accidentTime == null || enquetteData?.accidentTime=="") {

              MessageDisplays = "Veuillez renseigner l'heure de l'accident";
              StepReturnToComplete = 1;

          }else if(enquetteData?.place == null || enquetteData?.place=="") {

              MessageDisplays = "Veuillez renseigner la place precise de l'accident";
              StepReturnToComplete = 1;

          }else if(enquetteData?.crashImages == null || enquetteData?.crashImages?.length==0) {

              MessageDisplays = "Veuillez Capturez au moins une image de l'accident";
              StepReturnToComplete = 1;

          }else if(enquetteData?.city == null) {

              MessageDisplays = "Veuillez renseigner la ville du lieu de l'accident";
              StepReturnToComplete = 1;

          }else if(enquetteData?.municipality == null) {

              MessageDisplays = "Veuillez renseigner la municipalité du lieu de l'accident";
              StepReturnToComplete = 1;

          }else if(enquetteData?.accidentType == null) {

              MessageDisplays = "Veuillez renseigner le type de l'accident";
              StepReturnToComplete = 1;

          }else if(enquetteData?.climaticCondition == null) {

              MessageDisplays = "Veuillez renseigner la condition climatique du lieu de l'accident";
              StepReturnToComplete = 1;

          }else if(enquetteData?.brightnessCondition == null) {

              MessageDisplays = "Veuillez renseigner les conditions de luminosité du lieu de l'accident";
              StepReturnToComplete = 1;

          }else if(enquetteData?.accidentSeverity == null) {

              MessageDisplays = "Veuillez renseigner la gravité de l'accident";
              StepReturnToComplete = 1;

          }else



    //-----------Verification des donnee de l'enquette ( Partie 0 (Step 0)  pour ressensement des donees des vehicules accidentés) -------------------


               /*
                if(enquetteData?.vehicules == null || enquetteData?.vehicules?.length==0) {

                    MessageDisplays = "Veuillez renseigner les vehicules impliqués dans l'accident";
                    StepReturnToComplete = 2;

                }else */
          if(enquetteData?.vehicules != null || enquetteData?.vehicules?.length != 0) {
                  // ---- parcout le tableau des vehicules pour verifier les donnees de chaque vehicule
                  for (var vehicule in enquetteData!.vehicules!) {
                    // Ici, vous pouvez accéder aux propriétés de chaque véhicule
                    print(vehicule.id);
                    print(vehicule.vehicleAccidentNumber);
                    // etc...

                    if (vehicule.plate == null || vehicule.plate == "") {
                      MessageDisplays =
                      "Veuillez renseigner la plaque d'immatriculation du vehicule";
                      StepReturnToComplete = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ControllerAddVehicule(vehicule: vehicule),
                        ),
                      );
                      break;
                    } else
                    if (vehicule.chassis == null || vehicule.chassis == "") {
                      MessageDisplays =
                      "Veuillez renseigner le numero de chassis du vehicule";
                      StepReturnToComplete = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ControllerAddVehicule(vehicule: vehicule),
                        ),
                      );
                      break;
                    } else if (vehicule.type == null) {
                      MessageDisplays =
                      "Veuillez renseigner le type du vehicule pour ce vehicule";
                      StepReturnToComplete = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ControllerAddVehicule(vehicule: vehicule),
                        ),
                      );
                      break;
                    } else if (vehicule.brand == null) {
                      MessageDisplays =
                      "Veuillez renseigner la marque du vehicule pour ce vehicule";
                      StepReturnToComplete = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ControllerAddVehicule(vehicule: vehicule),
                        ),
                      );
                      break;
                    } else if (vehicule.model == null) {
                      MessageDisplays =
                      "Veuillez renseigner le model du vehicule pour ce vehicule";
                      StepReturnToComplete = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ControllerAddVehicule(vehicule: vehicule),
                        ),
                      );
                      break;
                    } else if (vehicule.fabricationYear == null ||
                        vehicule.fabricationYear == "") {
                      MessageDisplays =
                      "Veuillez renseigner l'année de fabrication du vehicule pour ce vehicule";
                      StepReturnToComplete = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ControllerAddVehicule(vehicule: vehicule),
                        ),
                      );
                      break;
                    } else if (vehicule.cylinderCapacity == null ||
                        vehicule.cylinderCapacity == "") {
                      MessageDisplays =
                      "Veuillez renseigner la cylindrée du vehicule pour ce vehicule";
                      StepReturnToComplete = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ControllerAddVehicule(vehicule: vehicule),
                        ),
                      );
                      break;
                    } else if (vehicule.specialFunction == null) {
                      MessageDisplays =
                      "Veuillez renseigner la fonction spéciale du vehicule pour ce vehicule";
                      StepReturnToComplete = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ControllerAddVehicule(vehicule: vehicule),
                        ),
                      );
                      break;
                    } else if (vehicule.vehicleAction == null) {
                      MessageDisplays =
                      "Veuillez renseigner l'action du vehicule pour ce vehicule";
                      StepReturnToComplete = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ControllerAddVehicule(vehicule: vehicule),
                        ),
                      );
                      break;
                    }
                  }
                }

    //-----------Verification des donnee de l'enquette ( Partie 0 (Step 0)  pour ressensement des donees des perosnnes accidenté ) -------------------


                if(enquetteData?.id == 0 || enquetteData?.id == null) {


                }else{

                  print("testing au cas ou ce n'ai pas nulk j'affcihe les donnees de l'enquette");

                  /*
                  if((enquetteData?.persons == null || enquetteData?.persons?.length==0)) {
                    MessageDisplays = "Veuillez renseigner les personnes impliquées dans l'accident";
                    StepReturnToComplete = 3;
                  } else */

                    if(enquetteData?.persons != null || enquetteData?.persons?.length != 0) {
                    // ---- parcout le tableau des vehicules pour verifier les donnees de chaque vehicule
                    for (var person in enquetteData!.persons!) {
                      // Ici, vous pouvez accéder aux propriétés de chaque véhicule
                      //print(person.id);
                      //print(person.personAccidentNumber);
                      //Logger().w("\n\n\n\n\n\n\n\n object person  VALIDATION DATA -- instance  PersonResp  :: \n\n ${person} \n\n");
                      // etc...


                      if (person.vehicleAccidentNumber == null ||
                          person.vehicleAccidentNumber == "" ||
                          person.vehicleLinkedPedestrian == null ||
                          person.vehicleLinkedPedestrian == "") {
                        MessageDisplays =
                        "Veuillez renseigner le vehicule lié la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.roadType == null) {
                        MessageDisplays =
                        "Veuillez renseigner la catégorie de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else
                      if (person.firstName == null || person.firstName == "") {
                        MessageDisplays =
                        "Veuillez renseigner le prenom de la personne";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else
                      if (person.lastName == null || person.lastName == "") {
                        MessageDisplays =
                        "Veuillez renseigner le nom de la personne";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else
                      if (person.birthDate == null || person.birthDate == "") {
                        MessageDisplays =
                        "Veuillez renseigner la date de naissance de la personne";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.drivingLicenceYear == null ||
                          person.drivingLicenceYear == "") {
                        MessageDisplays =
                        "Veuillez renseigner l'année d'obtention du permis de conduire de la personne";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else
                        /*if (person.nopermis == null || person.nopermis == "") {
                        MessageDisplays =
                        "Veuillez renseigner le numero du permis de conduire de la personne";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else*/
                      if (person.place == null) {
                        MessageDisplays =
                        "Veuillez renseigner le siège de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.range == null) {
                        MessageDisplays =
                        "Veuillez renseigner rangé d'assise de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.wearingHelmet == null) {
                        MessageDisplays =
                        "Veuillez renseigner le port du casque de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.occupantRestraintSystem == null) {
                        MessageDisplays =
                        "Veuillez renseigner l'equipement de securité de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.testStatus == null) {
                        MessageDisplays =
                        "Veuillez renseigner le status du test d'alcoolémie de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.testType == null) {
                        MessageDisplays =
                        "Veuillez renseigner le type de test d'alcoolémie de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.testResult == null) {
                        MessageDisplays =
                        "Veuillez renseigner le resultat du test d'alcoolémie de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.traumaSeverity == null) {
                        MessageDisplays =
                        "Veuillez renseigner la gravité du traumatisme de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.alcoholConsumption == null) {
                        MessageDisplays =
                        "Veuillez renseigner la consommation d'alcool de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.gender == null) {
                        MessageDisplays =
                        "Veuillez renseigner le genre de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.drugUse == null) {
                        MessageDisplays =
                        "Veuillez renseigner l'usage de drogue de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.profession == null) {
                        MessageDisplays =
                        "Veuillez renseigner la profession de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      } else if (person.personAction == null) {
                        MessageDisplays =
                        "Veuillez renseigner l'action de la personne accidentée";
                        StepReturnToComplete = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ControllerAddPerson(person: person),
                          ),
                        );
                        break;
                      }
                    }
                  }else{

                  }

                }



                  if(MessageDisplays==""){
                    StepReturnToComplete = 4;
                  }else{
                    //---- Validation des données de l'enquette
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return dialogWidCust(context,contentText: MessageDisplays!);
                      },
                      duration: Duration(milliseconds: 500),
                      animationType: DialogTransitionType.slideFromBottom,
                      curve: Curves.fastOutSlowIn,
                    );
                  }

   return StepReturnToComplete;
 }





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












///////////--------------- Alert Dialog bottom

 functionToAlertSuccess() async {
   //await MethodeLinkPersonInPatient(context: context, person: person);

   CustomBottomSheet(
     typeAction: 'success',
     heightFactor: 0.33,
     title: "Success",
     subTitle: "Confirmation Success",

     confirmAction: () async {

       print("\n\n\n print confirm create enquette--------- \n\n\n");

       await Future.delayed(Duration(milliseconds: 10));
        Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => listAccident()),
       );
        Future.delayed(Duration(milliseconds: 1));

     },
     exitAction: () async {
       print("Annuler");

       /*
       await Future.delayed(Duration(milliseconds: 10));
       await Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => listAccident()),
       );*/
       await Future.delayed(Duration(milliseconds: 1));
     },
     content:Container(
       margin: EdgeInsets.all(50),
       padding: EdgeInsets.all(10),
       height: 200,
       decoration: BoxDecoration(
         color: Colors.green[200],
         borderRadius: BorderRadius.circular(10),
       ),
       child: Center(
         child: Text(
           "Enquette Déclaré avec Success good !",
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.white,
           ),
           textAlign: TextAlign.center,
         ),
       ),
     ),
   ).show(context);

 }


 functionToAlertEditSuccess() async {
   //await MethodeLinkPersonInPatient(context: context, person: person);

   CustomBottomSheet(
     typeAction: 'success',
     heightFactor: 0.33,
     title: "Success",
     subTitle: "Confirmation Success",
     confirmAction: () async {

       print("\n\n\n print confirm Edit enquette \n\n\n");
       await Future.delayed(Duration(milliseconds: 10));
       await Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => listAccident()),
       );
       await Future.delayed(Duration(milliseconds: 1));

     },
     exitAction: () async {
       print("Annuler");


       /*
       await Future.delayed(Duration(milliseconds: 10));
       await Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => listAccident()),
       );*/
       await Future.delayed(Duration(milliseconds: 1));
     },
     content:Container(
       margin: EdgeInsets.all(50),
       padding: EdgeInsets.all(10),
       height: 200,
       decoration: BoxDecoration(
         color: Colors.green[200],
         borderRadius: BorderRadius.circular(10),
       ),
       child: Center(
         child: Text(
           "Modification de l'enquette effectuée avec Success",
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.white,
           ),
           textAlign: TextAlign.center,
         ),
       ),
     ),
   ).show(context);

 }


 functionToAlertError() async {
   //await MethodeLinkPersonInPatient(context: context, person: person);

   CustomBottomSheet(
     typeAction: 'danger',
     heightFactor: 0.33,
     title: "Echec",
     subTitle: "Execution de la requette echouer",
     confirmAction: () async {

       print("\n\n\n print Echec Execution de la requette \n\n\n");
       await Future.delayed(Duration(milliseconds: 10));

       await Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => listAccident()),
       );
       await Future.delayed(Duration(milliseconds: 1));

     },
     exitAction: () async {
       print("Annuler");

       /*
       await Future.delayed(Duration(milliseconds: 10));
       await Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => listAccident()),
       );*/
       await Future.delayed(Duration(milliseconds: 1));
     },
     content:Container(
       margin: EdgeInsets.all(50),
       padding: EdgeInsets.all(10),
       height: 200,
       decoration: BoxDecoration(
         color: Colors.red[200],
         borderRadius: BorderRadius.circular(10),
       ),
       child: Center(
         child: Text(
           "Echec de déclaration de la requette de l'enquette \nConnexion au serveur echouer",
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.white,
           ),
           textAlign: TextAlign.center,
         ),
       ),
     ),
   ).show(context);

 }





}
