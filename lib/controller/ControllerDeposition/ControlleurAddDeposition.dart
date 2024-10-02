import 'package:flutter/material.dart';
import 'package:secondtest/model/other_class_object/deposition_model.dart';

class ControllerAddDeposition extends StatefulWidget {
  Deposition? deposition;
  int? idEnquete;
  ControllerAddDeposition({
      super.key,
      this.deposition,
      required this.idEnquete,
    });

  @override
  State<ControllerAddDeposition> createState() => _ControllerAddDepositionState();
}

class _ControllerAddDepositionState extends State<ControllerAddDeposition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
