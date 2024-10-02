import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';


class FormNewRoadRecord extends StatelessWidget {
  @override

  TextEditingController field1Controller = TextEditingController();
  TextEditingController _field2Controller = TextEditingController();
  TextEditingController _field3Controller = TextEditingController();
  TextEditingController _field4Controller = TextEditingController();
  TextEditingController _field5Controller = TextEditingController();


  Widget build(BuildContext context) {

    var joeledit1="default" ;
    // Ajoutez des contrôleurs supplémentaires pour chaque champ de formulaire

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Form Field 1'),
          TextFormField(
            controller: field1Controller,
            onChanged: (val){

            },
            // Form Field 1 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 2'),
          TextFormField(
            controller: _field2Controller,
            // Form Field 2 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 3'),
          TextFormField(
            controller: _field3Controller,
            // Form Field 3 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 4'),
          TextFormField(
            controller: _field4Controller,
            // Form Field 4 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 5'),
          TextFormField(
            controller: _field5Controller,
            // Form Field 5 configuration
          ),
        ],
      ),
    );
  }
}




class FormNewInfoAccidentRecord extends StatelessWidget {
  @override

  TextEditingController fieldTestController = TextEditingController();
  TextEditingController field2Controller = TextEditingController();
  TextEditingController _field3Controller = TextEditingController();
  TextEditingController _field4Controller = TextEditingController();
  TextEditingController _field5Controller = TextEditingController();


  Widget build(BuildContext context) {

    var joeledit1="default" ;
    // Ajoutez des contrôleurs supplémentaires pour chaque champ de formulaire

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Form Field 1'),
          TextFormField(
            controller: fieldTestController,
            onChanged: (val){

            },
            // Form Field 1 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 2'),
          TextFormField(
            controller: field2Controller,
            // Form Field 2 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 3'),
          TextFormField(
            controller: _field3Controller,
            // Form Field 3 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 4'),
          TextFormField(
            controller: _field4Controller,
            // Form Field 4 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 5'),
          TextFormField(
            controller: _field5Controller,
            // Form Field 5 configuration
          ),
        ],
      ),
    );
  }
}





class FormNewCarRecord extends StatelessWidget {
  @override

  TextEditingController _field1Controller = TextEditingController();
  TextEditingController field2Controller = TextEditingController();
  TextEditingController _field3Controller = TextEditingController();
  TextEditingController _field4Controller = TextEditingController();
  TextEditingController _field5Controller = TextEditingController();


  Widget build(BuildContext context) {

    var joeledit1="default" ;
    // Ajoutez des contrôleurs supplémentaires pour chaque champ de formulaire

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Form Field 1'),
          TextFormField(
            controller: _field1Controller,
            onChanged: (val){

            },
            // Form Field 1 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 2'),
          TextFormField(
            controller: field2Controller,
            // Form Field 2 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 3'),
          TextFormField(
            controller: _field3Controller,
            // Form Field 3 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 4'),
          TextFormField(
            controller: _field4Controller,
            // Form Field 4 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 5'),
          TextFormField(
            controller: _field5Controller,
            // Form Field 5 configuration
          ),
        ],
      ),
    );
  }
}







class FormNewVictimeRecord extends StatelessWidget {
  @override

  TextEditingController limiteVitesse = TextEditingController();
  TextEditingController typeDeRoute = TextEditingController();
  TextEditingController _field3Controller = TextEditingController();
  TextEditingController _field4Controller = TextEditingController();
  TextEditingController _field5Controller = TextEditingController();


  Widget build(BuildContext context) {

    var joeledit1="default" ;
    // Ajoutez des contrôleurs supplémentaires pour chaque champ de formulaire

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Limite de Vitesse'),
          TextFormField(
            controller: limiteVitesse,
            onChanged: (val){

            },
            // Form Field 1 configuration
          ),
          SizedBox(height: 10),
          Text('Type De ROute'),
          TextFormField(
            controller: typeDeRoute,
            // Form Field 2 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 3'),
          TextFormField(
            controller: _field3Controller,
            // Form Field 3 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 4'),
          TextFormField(
            controller: _field4Controller,
            // Form Field 4 configuration
          ),
          SizedBox(height: 10),
          Text('Form Field 5'),
          TextFormField(
            controller: _field5Controller,
            // Form Field 5 configuration
          ),
        ],
      ),
    );
  }
}


