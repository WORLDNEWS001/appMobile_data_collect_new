import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/one_select/view_one_select_form.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/VehiculeResp.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
import 'package:secondtest/services/manage_image/pick_image_data.dart';
import 'package:select_form_field/select_form_field.dart';

class ControllerAddVehicule extends StatefulWidget {
  VehiculeResp? vehicule;
  bool isConsult;

  ControllerAddVehicule({
    Key? key,
    this.vehicule,
    this.isConsult = false,
  }) : super(key: key);

  @override
  State<ControllerAddVehicule> createState() => _ControllerAddVehiculeState();
}

class _ControllerAddVehiculeState extends State<ControllerAddVehicule> {
  late PickImageData? pickImageDataLocal;
  //late TextEditingController? numeroVehiculeController;
  late TextEditingController? _timeController;
  ProviderColleteDataEnquete? providerColleteDataEnquete;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providerColleteDataEnquete = context.read<ProviderColleteDataEnquete>();

    if (widget.vehicule == null) {
      providerColleteDataEnquete?.resetDataFormVehicule();
    } else {
      providerColleteDataEnquete?.isUpdateVehicule = true;
      providerColleteDataEnquete?.UpdateFormOneVehiculeSelect(
          oneVehiculeCrash: widget.vehicule);
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    pickImageDataLocal = context
        .watch<ProviderColleteDataEnquete>()
        .data_enq_ProviderPickImageVehiculeCrash;
    providerColleteDataEnquete = context.watch<ProviderColleteDataEnquete>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.vehicule = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enregitrement Vehicule"),
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
                child: Image.asset('assets/icon_doser/car_record/car_crash.png',
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
                      onPressed: widget.isConsult ? null :
                          () {
                        pickImageDataLocal?.pickImageGallerie(context: context);
                        setState(() {});
                      },
                      child: Icon(Icons.photo_library_outlined),
                    ),
                    ElevatedButton(
                      onPressed: widget.isConsult ? null :
                          () {
                        pickImageDataLocal?.resetPickImage();
                        context
                            .read<ProviderColleteDataEnquete>()
                            .setImageVehiculeProvider();
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
                              .data_enq_ProviderPickImageVehiculeCrash
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
                                          .data_enq_ProviderPickImageVehiculeCrash!
                                          .ListPathImages![index])
                                      ? Image.network(
                                          provider
                                              .data_enq_ProviderPickImageVehiculeCrash!
                                              .ListPathImages![index],
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          File(provider
                                              .data_enq_ProviderPickImageVehiculeCrash!
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
                height: 15,
              ),

              TextFormField(
                readOnly: widget.isConsult,
                keyboardType: TextInputType.number,
                controller: providerColleteDataEnquete
                    ?.data_enq_num_vehicule_controller,
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
                  labelText: "Numero du vehicule",
                  enabled: false,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez Entrer le numero du vehicule";
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
                    providerColleteDataEnquete?.data_enq_num_immatriculation,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/car_record/matricule.png',
                      width: 50,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Plaque d'immatriculation",
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
                controller: providerColleteDataEnquete?.data_enq_num_chassis,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/car_record/NumeroChassi-suf.png',
                      width: 50,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/car_record/NumeroChassi-pre.png',
                      width: 50,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Numero de chassis",
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

              TextFormField(
                readOnly: widget.isConsult,
                keyboardType: TextInputType.number,
                controller:
                    providerColleteDataEnquete?.data_enq_year_model_vehicule,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/car_record/anneeFabrication.png',
                      width: 50,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Année de Fabrication",
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
                keyboardType: TextInputType.number,
                controller: providerColleteDataEnquete?.data_enq_nbr_cylindre,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    // Ajoutez de l'espace à droite de l'icône
                    child: Image.asset(
                      'assets/icon_doser/car_record/nombreCylindre.png',
                      width: 50,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Nombre de cylindre",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez Entrer le nombre de cylindre du vehicule";
                  }
                },
              ),

              SizedBox(
                height: 10,
              ),

              //---------------------Generate this Widget select type de route -----------------
              ViewOneSelectForm(
                Disable: widget.isConsult,
                liste_de_type: context
                    .watch<DataOmsSelectProvider>()
                    .vehicleTypeRespListSelect,
                default_one_data_liste:
                    providerColleteDataEnquete?.data_enq_vehicle_type,
                labelText: "Type de vehicule",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                    "assets/icon_doser/car_record/type_voiture.png",
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
                    context.watch<DataOmsSelectProvider>().brandRespListSelect,
                default_one_data_liste:
                    providerColleteDataEnquete?.data_enq_brand,
                labelText: "Marque de vehicule",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                    "assets/icon_doser/car_record/marque_voiture.png",
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
                    .vehicleModelRespListSelect,
                default_one_data_liste:
                    providerColleteDataEnquete?.data_enq_vehicleModel,
                labelText: "Model de vehicule",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                    "assets/icon_doser/car_record/model_voiture.png",
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
                    .specialFunctionRespListSelect,
                default_one_data_liste:
                    providerColleteDataEnquete?.data_enq_specialFunction,
                labelText: "Fontions Specials de vehicule",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                    "assets/icon_doser/car_record/fonctionnaliteSpecial.png",
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
                    .vehicleActionRespListSelect,
                default_one_data_liste: providerColleteDataEnquete
                    ?.data_enq_vehicleActionRespListSelect,
                labelText: "Manoeuvre de vehicule",
                //iconData:Icons.edit_road,
                path_asset_image_icon:
                    "assets/icon_doser/car_record/vehicule_action.png",
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
    providerColleteDataEnquete?.Update_list_data_enq_vehicules();

    //-----------------  Enregistrement des données du vehicule  -----------------//
    Navigator.pop(context);
  }
}
