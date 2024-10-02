import 'package:flutter/material.dart';
import 'package:secondtest/widgets/recordNewEnquete_test_old//widgetFormNewEnquete.dart';



var joeledit;

FormNewRoadRecord formRoadRecord =FormNewRoadRecord();
FormNewInfoAccidentRecord formInfoAccidentRecord =FormNewInfoAccidentRecord();
FormNewCarRecord formCarRecord =FormNewCarRecord();
FormNewVictimeRecord formVictimeRecord =FormNewVictimeRecord();


class newEnqueteRecord extends StatefulWidget {
  const newEnqueteRecord({Key? key}) : super(key: key);
  @override
  State<newEnqueteRecord> createState() => _newEnqueteRecordState();
}


class _newEnqueteRecordState extends State<newEnqueteRecord> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Nouvelle Enquête'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CollapsibleForm(
              title: 'Enregistrement de la Route',
              child: Column(
                children: [
                  //FormWidget(),
                  formRoadRecord,
                ],
              ),
            ),
            CollapsibleForm(
              title: 'Enregistrement Infos Accidents',
              child: Column(
                children: [
                  //FormWidget(),
                  formInfoAccidentRecord,
                ],
              ),
            ),
            CollapsibleForm(
              title: 'Enregistrement Vehicules ',
              child: Column(
                children: [
                  //FormWidget(),
                  formCarRecord,
                ],
              ),
            ),
            CollapsibleForm(
              title: 'Enregistrement Accidentés',
              child: Column(
                children: [
                  // FormWidget(),
                  formVictimeRecord,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CollapsibleForm extends StatefulWidget {
  final String title;
  final Widget child;

  CollapsibleForm({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  _CollapsibleFormState createState() => _CollapsibleFormState();
}


class _CollapsibleFormState extends State<CollapsibleForm> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ExpansionTile(
        backgroundColor: Colors.white10,
        collapsedBackgroundColor: Colors.lightGreen,
        iconColor: Colors.red,
        textColor: Colors.red,
        collapsedTextColor: Colors.white,
        title: Text(widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        initiallyExpanded: _isExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
            //print(formInfoAccidentRecord._field1Controller.text);
           // print(formRoadRecord.field1Controller.text);
          //  print(formInfoAccidentRecord.fieldTestController.text);
           // print(formCarRecord.field2Controller.text);
           // print(formVictimeRecord.field2Controller.text);
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}










