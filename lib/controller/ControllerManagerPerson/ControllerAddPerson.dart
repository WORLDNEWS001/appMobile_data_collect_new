import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/one_select/view_one_select_form.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/PersonResp.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
import 'package:secondtest/services/manage_image/pick_image_data.dart';
import 'package:select_form_field/select_form_field.dart';

class ControllerAddPerson extends StatefulWidget {
  PersonResp? person;
  bool isConsult;

  ControllerAddPerson({
    Key? key,
    this.person,
    this.isConsult = false,
  }) : super(key: key);

  @override
  State<ControllerAddPerson> createState() => _ControllerAddPersonState();
}

class _ControllerAddPersonState extends State<ControllerAddPerson> {
  late PickImageData? pickImageDataLocal;

  late TextEditingController? _timeController;
  ProviderColleteDataEnquete? providerColleteDataEnquete;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providerColleteDataEnquete = context.read<ProviderColleteDataEnquete>();

    if (widget.person == null) {
      providerColleteDataEnquete?.resetDataFormPerson();
    } else {
      providerColleteDataEnquete?.isUpdatePerson = true;
      providerColleteDataEnquete?.UpdateFormOnePersonSelect(onePersonCrash: widget.person);
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    pickImageDataLocal = context.watch<ProviderColleteDataEnquete>().data_enq_ProviderPickImagePersonCrash;
    providerColleteDataEnquete = context.watch<ProviderColleteDataEnquete>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.person = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enregitrement Accidentés"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 110,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 10),
                child: Image.asset('assets/icon_doser/person_record/person_crash.png',
                    fit: BoxFit.contain, scale: 1.0),
              ),

              SizedBox(
                height: 15,
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                        onPressed: widget.isConsult ? null :
                            () {
                          pickImageDataLocal?.pickImageCamera(context: context);
                          setState(() {});
                        },
                        child: Icon(Icons.camera_alt_outlined)),
                    ElevatedButton(
                      onPressed:  widget.isConsult ? null :
                          () {
                        pickImageDataLocal?.pickImageGallerie(context: context);
                        setState(() {});
                      },
                      child: Icon(Icons.photo_library_outlined),
                    ),
                    ElevatedButton(
                      onPressed:  widget.isConsult ? null :
                          () {
                        pickImageDataLocal?.resetPickImage();
                        context.read<ProviderColleteDataEnquete>().setImagePersonProvider();
                        setState(() {});
                      },
                      child: Icon(Icons.delete_forever),
                    ),
                  ]),

              Consumer<ProviderColleteDataEnquete>(
                builder: (context, provider, child) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue[50],
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: GridView.builder(
                          itemCount: provider
                              .data_enq_ProviderPickImagePersonCrash
                              ?.ListPathImages
                              ?.length,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                  MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GlobalMethod.isURL(provider
                                      .data_enq_ProviderPickImagePersonCrash!
                                      .ListPathImages![index])
                                      ? Image.network(
                                    provider
                                        .data_enq_ProviderPickImagePersonCrash!
                                        .ListPathImages![index],
                                    fit: BoxFit.cover,
                                  )
                                      : Image.file(
                                    File(provider
                                        .data_enq_ProviderPickImagePersonCrash!
                                        .ListPathImages![index]),
                                    fit: BoxFit.cover,
                                  ),
                                ));
                          },
                        )),
                  );
                },
              ),

              SizedBox(
                height: 5,
              ),

              //---------------------Generate this Widget select type de route -----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context.watch<ProviderColleteDataEnquete>().list_data_enq_vehicules,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_vehiculeChoise,
                labelText: "Selectionnez le Vehicule",
                //iconData:Icons.edit_road,
                path_asset_image_icon: "assets/icon_doser/car_record/type_voiture.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),
              //---------------------End Generate this Widget select -----------------

              //---------------------Generate this Widget select type de route -----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context.watch<DataOmsSelectProvider>().personRoadTypeRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_personRoadType,
                labelText: "Catégorie de personne",
                //iconData:Icons.person,
                path_asset_image_icon: "assets/icon_doser/person_record/person.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),
              //---------------------End Generate this Widget select -----------------


              SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: widget.isConsult,
                keyboardType: TextInputType.number,
                controller: providerColleteDataEnquete
                    ?.data_enq_personAccidentNumber_controller,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/car_record/NumeroVehicule.png',
                      width: 50,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Numero de l'accidenté",
                  enabled: false,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez Entrer le numero du Personnage";
                  }
                },
              ),



              SizedBox(
                height: 15,
              ),

              TextFormField(
                readOnly: widget.isConsult,
                keyboardType: TextInputType.name,
                controller:
                providerColleteDataEnquete?.data_enq_firstName,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/person_record/firstName.png',
                      width: 50,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Nom de l'accidenté",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez Entrer la plaque immatriculation du vehicule";
                  }
                },
              ),

              SizedBox(
                height: 15,
              ),

              TextFormField(
                readOnly: widget.isConsult,
                controller: providerColleteDataEnquete?.data_enq_lastName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/person_record/lastName.png',
                      width: 50,
                    ),
                  ),
                  // suffixIcon: Padding(
                  //   padding: EdgeInsets.only(right: 10, left: 10),
                  //   // Ajoutez de l'espace à droite de l'icône
                  //   child: Image.asset(
                  //     'assets/icon_doser/car_record/NumeroChassi-pre.png',
                  //     width: 50,
                  //   ),
                  // ),
                  border: OutlineInputBorder(),
                  labelText: "Prenom de l'accidenté",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez Entrer la Numero de chassis du vehicule";
                  }
                },
              ),

              SizedBox(
                height: 15,
              ),


              TextField(
                
                controller: providerColleteDataEnquete?.data_enq_birthDate,
                readOnly: true,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      // Ajoutez de l'espace à droite de l'icône
                      child: Image.asset(
                        'assets/icon_doser/person_record/birthDate.png',
                        width: 50,
                      ),
                    ),
                    labelText: 'Date de naissance',
                    border: OutlineInputBorder(),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueAccent
                      ),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.calendar_today),
                        onPressed: widget.isConsult ? null :
                            () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2080),
                          );
                          if (date != null) {
                            final formattedDate = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                            providerColleteDataEnquete?.data_enq_birthDate?.text = formattedDate;
                          }
                        },
                      ),
                    )
                ),
              ),

              SizedBox(
                height: 15,
              ),

              TextFormField(
                readOnly: widget.isConsult,
                //keyboardType: TextInputType.number,
                controller:
                providerColleteDataEnquete?.data_enq_drivingLicenceYear,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/person_record/drivingLicenceYear.png',
                      width: 50,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Année de permis de conduire",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez Entrer l'année de fabrication du vehicule";
                  }
                },
              ),


              SizedBox(
                height: 15,
              ),

              TextFormField(
                readOnly: widget.isConsult,
                //keyboardType: TextInputType.number,
                controller:
                providerColleteDataEnquete?.data_enq_nopermis,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/person_record/nopermis.png',
                      width: 50,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Numero de permis de conduire",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez Entrer l'année de fabrication du vehicule";
                  }
                },
              ),


              SizedBox(
                height: 10,
              ),

              //---------------------Generate this Widget select siege de l'accidenté dans le vehicuel -----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context
                    .watch<DataOmsSelectProvider>()
                    .seatingPlaceRespListSelect,
                default_one_data_liste:
                providerColleteDataEnquete?.data_enq_place,
                labelText: "Siege de l'accidenté",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                "assets/icon_doser/person_record/seatingPlace.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),
              //---------------------End Generate this Widget select -----------------

              SizedBox(
                height: 2,
              ),

              //---------------------Generate this Widget select type de route -----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type:
                context.watch<DataOmsSelectProvider>().seatingRangeRespListSelect,
                default_one_data_liste:
                providerColleteDataEnquete?.data_enq_range,
                labelText: "Rangé de l'accidenté",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                "assets/icon_doser/person_record/seatingRange.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),
              //---------------------End Generate this Widget select -----------------

              SizedBox(
                height: 2,
              ),

              //---------------------Generate this Widget select type de route -----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context
                    .watch<DataOmsSelectProvider>()
                    .wearingHelmetRespListSelect,
                default_one_data_liste:
                providerColleteDataEnquete?.data_enq_wearingHelmet,
                labelText: "Port du casque",
                //iconData:Icons.edit_road,
                path_asset_image_icon: "assets/icon_doser/person_record/wearingHelmet.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),
              //---------------------End Generate this Widget select -----------------

              SizedBox(
                height: 2,
              ),

              //---------------------Generate this Widget select type de route -----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context.watch<DataOmsSelectProvider>().occupantRestraintSystemRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_occupantRestraintSystem,
                labelText: "Equipement de securiter",
                //iconData:Icons.edit_road,
                path_asset_image_icon: "assets/icon_doser/person_record/occupantRestraintSystem_equip_securiter.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),
              //-----------------End Generate this Widget select -----------------

              SizedBox(
                height: 2,
              ),
              //---------------------Generate this Widget select Manoeuvre de vehicule-----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context
                    .watch<DataOmsSelectProvider>()
                    .alcoholTestStatusRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_testStatus,
                labelText: "Statut Test d'alcoolémie",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                "assets/icon_doser/person_record/testStatus.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),


              SizedBox(
                height: 2,
              ),

              //---------------------Generate this Widget select type de route -----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context
                    .watch<DataOmsSelectProvider>()
                    .alcoholTestTypeRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_testType,
                labelText: "Type Test d'alcoolémie",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                "assets/icon_doser/person_record/testType.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),
              //-----------------End Generate this Widget select -----------------

              SizedBox(
                height: 2,
              ),
              //---------------------Generate this Widget select Manoeuvre de vehicule-----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context
                    .watch<DataOmsSelectProvider>()
                    .alcoholTestResultRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_testResult,
                labelText: "Resultat Test d'alcoolémie",
                //iconData:Icons.edit_road,
                path_asset_image_icon: "assets/icon_doser/person_record/testResult.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),


              SizedBox(
                height: 2,
              ),

              //---------------------Generate this Widget select type de route -----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context.watch<DataOmsSelectProvider>().traumaSeverityRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_traumaSeverity,
                labelText: "Gravité des blessures",
                //iconData:Icons.edit_road,
                path_asset_image_icon: "assets/icon_doser/person_record/traumaSeverity.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),
              //-----------------End Generate this Widget select -----------------

              SizedBox(
                height: 2,
              ),
              //---------------------Generate this Widget select Manoeuvre de vehicule-----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context.watch<DataOmsSelectProvider>().alcoholConsumptionRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_alcoholConsumption,
                labelText: "Consommation d'alcool",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                "assets/icon_doser/person_record/alcoholConsumption.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),


              SizedBox(
                height: 2,
              ),
              //---------------------Generate this Widget select Manoeuvre de vehicule-----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context.watch<DataOmsSelectProvider>().genderRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_gender,
                labelText: "Genre",
                //iconData:Icons.edit_road,
                path_asset_image_icon: "assets/icon_doser/person_record/gender.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),



              SizedBox(
                height: 2,
              ),
              //---------------------Generate this Widget select Manoeuvre de vehicule-----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context.watch<DataOmsSelectProvider>().personDrugUseRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_drugUse,
                labelText: "Usage de drogue",
                //iconData:Icons.edit_road,
                path_asset_image_icon: "assets/icon_doser/person_record/drugUse.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),


              SizedBox(
                height: 2,
              ),

              //---------------------Generate this Widget select Manoeuvre de vehicule-----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context.watch<DataOmsSelectProvider>().professionRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_Profession,
                labelText: "Profession",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                "assets/icon_doser/person_record/profession.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),


              SizedBox(
                height: 2,
              ),
              //---------------------Generate this Widget select Manoeuvre de vehicule-----------------
              ViewOneSelectForm(
              Disable: widget.isConsult,
                liste_de_type: context.watch<DataOmsSelectProvider>().actionRespListSelect,
                default_one_data_liste: providerColleteDataEnquete?.data_enq_personAction,
                labelText: "Action de l'accidenté",
                //iconData:Icons.edit_road,
                path_asset_image_icon: "assets/icon_doser/person_record/personAction.png",
                function_onChanged: (selectedValue) {
                  print(selectedValue?.value);
                  providerColleteDataEnquete?.Update_data_enq(selectedValue);
                },
              ),




            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                cancelDataNewCar();
              },
              icon: Icon(Icons.cancel, size: 50),
              label: Text('Annuler'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Changer la couleur d'arrière-plan
              ),
            ),
            ElevatedButton.icon(
              onPressed: widget.isConsult ? null :
                  () {
                saveDataNewCar();
              },
              icon: Icon(Icons.add_circle, size: 50),
              label: Text('Continuer'),
              style: ElevatedButton.styleFrom(
                primary:
                Colors.orange[300], // Changer la couleur d'arrière-plan
              ),
            ),
          ],
        ),
      ),
    );
  }

  cancelDataNewCar() {
    print("--------/////////---  Annuler  ---/////////--------");
    Navigator.pop(context);
  }

  saveDataNewCar() {
    print("--------/////////---  Enregistrer  ---/////////--------");
    providerColleteDataEnquete?.Update_list_Person();
    //-----------------  Enregistrement des données de l'accidenté  -----------------//
    Navigator.pop(context);
  }
}
