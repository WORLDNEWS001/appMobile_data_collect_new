import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
//import 'package:secondtest/screen/enqueteScreens/newEnqueteStepWizard.dart';


class recordInfoAccident extends StatefulWidget {

  const recordInfoAccident({Key? key, required this.onStepUpdated}) : super(key: key);
  final Function(int) onStepUpdated;

  //recordInfoAccident({required this.onStepUpdated});

  @override
  State<recordInfoAccident> createState() => _recordInfoAccidentState();
}

class _recordInfoAccidentState extends State<recordInfoAccident> {




  void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    print("je suis dans la fonction somme action du child ");

    widget.onStepUpdated(3);
  }



  var LimiteVitesse;
  var TypeRoute;

  final List<Map<String, dynamic>> _items_TypeRoad = [
    {
      'value': 'Autoroute',
      'label': 'Autoroute',
      //'icon': Icon(Icons.stop),
    },
    {
      'value': 'RouteExpress',
      'label': 'Route express',
      //'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.blue),
    },
    {
      'value': 'RouteUrbaineDoubleSens',
      'label': 'Route urbaine, a double sens',
      'enable': false,
      //'icon': Icon(Icons.grade),
    },
    {
      'value': 'RouteUrbaineSensUnique',
      'label': 'Route urbaine, a sens unique',
      'enable': false,
      //'icon': Icon(Icons.grade),
    },
  ];
  final List<Map<String, dynamic>> _items_TypeEtatRoad = [
    {
      'value': 'Seche',
      'label': 'Seche',
      //'icon': Icon(Icons.stop),
    },
    {
      'value': 'Neige',
      'label': 'Neige',
      //'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.blue),
    },
    {
      'value': 'Glissante',
      'label': 'Glissante',
      'enable': false,
      //'icon': Icon(Icons.grade),
    },
    {
      'value': 'Humide',
      'label': 'Humide',
      'enable': false,
      //'icon': Icon(Icons.grade),
    },
  ];
  final List<Map<String, dynamic>> _items_TraficRoad = [
    {
      'value': 'Seche',
      'label': 'Seche',
      //'icon': Icon(Icons.stop),
    },
    {
      'value': 'Neige',
      'label': 'Neige',
      //'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.blue),
    },
    {
      'value': 'Glissante',
      'label': 'Glissante',
      'enable': false,
      //'icon': Icon(Icons.grade),
    },
    {
      'value': 'Humide',
      'label': 'Humide',
      'enable': false,
      //'icon': Icon(Icons.grade),
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: LimiteVitesse,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Limite de Vitesse'),
            validator: (value){
              if(value!.isEmpty){
                return "Entrez la limite de vitesse";
              }
            },
          ),

          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            initialValue: 'circle',
            icon: Icon(Icons.add_road_sharp),
            labelText: 'Type Route',
            items: _items_TypeRoad,
            onChanged: (val) {
              print(val);
              //updateCurrentStep(2);
              setState(() {
                //someAction();
                print(val);


              });

            },

            onSaved: (val) => print(val),

          ),

        ],
      ),
    );
  }
}


/*

utilisation du call back error vers la page enfant
    creation de la fonction a executer dans la page parent


  void updateCurrentStep (int step){
    setState(() {
      currentStep = step;
    });


  }

  execution de la fonction par call back venant de la page children


 content: recordInfoAccident(
          onStepUpdated: updateCurrentStep
      ),
 */