

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/provider/collecte_data_provider/provider_collecte_data_enquette.dart';

class ViewOneTextFormField<T> extends StatelessWidget{


  String? label_text_form;
  TextEditingController? controller_text_form_field;
  String? data_info_validator;



  ViewOneTextFormField({
    required this.label_text_form,
    required this.controller_text_form_field,
    this.data_info_validator="Entrez la limite de vitesse"

});

  @override
  Widget build(BuildContext context) {
    print("-------------Je suis dans le form field ------------");
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: TextFormField(
        controller: controller_text_form_field,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label_text_form
        ),
        onEditingComplete: () {
          print("----------onEditingComplete---- ${label_text_form} ");
        },
        onChanged: (value) {
          print("---- onChanged ---  ${value}" );
          print("-------------Onchange------------- ${context.read<ProviderColleteDataEnquete>().controller_limite_vitesse?.text}");
        },

        validator: (value){
          if(value!.isEmpty){
            return data_info_validator;
          }else{

          }

          //print("-------------Data Validator after return-------------");
          //print("-------------Data Validator after return------------- ${context.watch<ProviderColleteDataEnquete>().data_enq_limite_vitesse}");
        },
      ),
    );
  }
}