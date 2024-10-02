
import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/View/Formulaires_Enquete/View_Dialog/detail_view_dialog/detail_view_dialog_objet.dart';
import 'package:secondtest/View/Formulaires_Enquete/one_select/view_one_select_form.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';
import 'package:secondtest/model/provider/data_oms_provider/data_oms_select_provider.dart';
import 'package:secondtest/services/manage_image/pick_image_data.dart';
import 'package:select_form_field/select_form_field.dart';

import 'package:image_picker/image_picker.dart';




class recordAccidentInfo extends StatefulWidget {

  recordAccidentInfo({Key? key,
    required this.onStepUpdated,
    this.isConsult = false
  }) : super(key: key);
  Function(int) onStepUpdated;
  bool isConsult;

  @override
  State<recordAccidentInfo> createState() => _recordAccidentInfoState();
}





class _recordAccidentInfoState extends State<recordAccidentInfo> {

  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    var date_init = DateTime.now(); // Initialisation de selectedDate ici
  }

  //----------FONCTION IMPLEMENT TO UPDATE STEP VALUE--------------//
  void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...

    print("je suis dans la fonction sommeAction du child de record accident info ");
    widget.onStepUpdated(3);

  }
  //--

  late TextEditingController? _dateController;
  late TextEditingController? _timeController;

  late TextEditingController? PlacesAccident;
  late List<String>? listPathImageCrashUrlNetwork = [];

  late PickImageData? pickImageDataLocal;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _dateController =
        context.watch<ProviderColleteDataEnquete>().date_accident_controller;
    _timeController =
        context.watch<ProviderColleteDataEnquete>().time_accident_controller;
    PlacesAccident =
        context.watch<ProviderColleteDataEnquete>().places_accident_controller;
    pickImageDataLocal = context
        .watch<ProviderColleteDataEnquete>()
        .data_enq_ProviderPickImageDataCrashLocal;
  }






  @override
  Widget build(BuildContext context) {



    return Container(
      child: Column(
        children: <Widget> [

          SizedBox(height: 15,),


          Column(
            children: <Widget>[
              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date',
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
                            _dateController?.text = formattedDate;
                          }
                        },
                      ),
                  )
                ),
              ),
              TextField(
                controller: _timeController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Time',
                  suffixIcon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueAccent
                    ),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.access_time),
                      onPressed: widget.isConsult ? null :
                          () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          final formattedTime = "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
                          _timeController?.text = formattedTime;
                        }
                      },
                    ),
                  )


                ),
              ),
            ],
          ),



          SizedBox(height: 15,),

          TextFormField(
            controller: context.watch<ProviderColleteDataEnquete>().places_accident_controller,

            readOnly: widget.isConsult,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(),
                labelText: 'Places'),

            validator: (value){
              if(value!.isEmpty){
                return "Veuillez Entrer L'emplacement (N° rue) de l'accident";
              }
            },

            onChanged: (value){
             context.read<ProviderColleteDataEnquete>().Update_data_enq;
            },
          ),

          SizedBox(height: 5,),

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
                    context.read<ProviderColleteDataEnquete>().setImageCrashLocalProvider();
                    setState(() {});
                  },
                  child: Icon(Icons.delete_forever),
                ),
              ]),

          Consumer<ProviderColleteDataEnquete>(
            builder: (context, provider, child) {
              return Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue[100],
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: GridView.builder(
                      itemCount: provider
                          .data_enq_ProviderPickImageDataCrashLocal
                          ?.ListPathImages
                          ?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                color: Colors.cyan[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: GlobalMethod.isURL(provider
                                      .data_enq_ProviderPickImageDataCrashLocal!
                                      .ListPathImages![index])
                                  ? Image.network(
                                      provider
                                          .data_enq_ProviderPickImageDataCrashLocal!
                                          .ListPathImages![index],
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(provider
                                          .data_enq_ProviderPickImageDataCrashLocal!
                                          .ListPathImages![index]),
                                      fit: BoxFit.cover,
                                    ),

                              /*
                                Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.white,
                                  margin: EdgeInsets.all(5),
                                )

                                 */
                            ));
                      },
                    )),
              );
            },
          ),

          /*
            //  :
          Container(
            height: MediaQuery.of(context).size.height/4,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[500],
            child: Padding(
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                itemCount: listPathImageCrash.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index){
                  return
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: /*Image.file(
                          File(listPathImageCrash[index]),
                          fit:BoxFit.cover,
                        )*/
                      Image.asset(
                          'assets/icon_doser/car_record/car_crash.png',
                          fit: BoxFit.contain,
                          scale: 1.0
                      ),

                    );
                },
              ),
            ),
          ),
        */


          //---------------------Generate this Widget select causes Accident-----------------
          ViewOneSelectForm(
            Disable: widget.isConsult,
            liste_de_type: context.watch<DataOmsSelectProvider>().directCauseRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_direct_cause?[0],
            //default_one_data_liste: null,
            labelText: "Cause Directe",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/ville.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------


          //---------------------Generate this Widget select type de route -----------------
          ViewOneSelectForm(
              Disable: widget.isConsult,
            liste_de_type: context.watch<DataOmsSelectProvider>().cityRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_city,
            labelText: "Ville",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/ville.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------




          //---------------------Generate this Widget select type de Municipalité -----------------
          ViewOneSelectForm(
              Disable: widget.isConsult,
            liste_de_type: context.watch<DataOmsSelectProvider>().municipalityRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_municipality,
            labelText: "Municipalité",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/municipalite.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------

         
          //---------------------Generate this Widget select type de Type d'accident  -----------------
          ViewOneSelectForm(
            Disable: widget.isConsult,
            liste_de_type: context.watch<DataOmsSelectProvider>().accidentTypeRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_accident_type,
            labelText: "Type d'accident",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/accident.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------
          //---------------------End Generate this Widget select -----------------











          //---------------------Generate this Widget select type de Conditions Climatiques -----------------
          ViewOneSelectForm(
              Disable: widget.isConsult,
            liste_de_type: context.watch<DataOmsSelectProvider>().climaticConditionRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_climatic_condition,
            labelText: "Conditions Climatiques",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/climate.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------









          //---------------------Generate this Widget select type de Conditions Type d'impact -----------------
          ViewOneSelectForm(
              Disable: widget.isConsult,
            liste_de_type: context.watch<DataOmsSelectProvider>().impactTypeRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_impact_type,
            labelText: "Type d'impact",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/impact.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------







          //---------------------Generate this Widget select type de  Condition Luminosité -----------------
          ViewOneSelectForm(
              Disable: widget.isConsult,
            liste_de_type: context.watch<DataOmsSelectProvider>().brightnessConditionRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_brightness_condition,
            labelText: "Condition Luminosité",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/brightness.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------







          //---------------------Generate this Widget select type de  Gravité de l'accident-----------------
          ViewOneSelectForm(
              Disable: widget.isConsult,
            liste_de_type: context.watch<DataOmsSelectProvider>().accidentSeverityRespListSelect,
            default_one_data_liste: context.watch<ProviderColleteDataEnquete>().data_enq_accident_severity,
            labelText: "Gravité de l'accident",
            //iconData:Icons.edit_road,
            path_asset_image_icon: "assets/icon_doser/accident_info/gravi_accident.png",
            function_onChanged: (selectedValue) {
              print(selectedValue?.value);
              context.read<ProviderColleteDataEnquete>().Update_data_enq(selectedValue);
            },
          ),

          //---------------------End Generate this Widget select -----------------

        ],
      ),
    );
  }








}
