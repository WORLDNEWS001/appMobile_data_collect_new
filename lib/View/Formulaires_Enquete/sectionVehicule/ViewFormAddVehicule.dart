import 'package:flutter/material.dart';

class ViewFormAddVehicule extends StatefulWidget {
  TextEditingController? TextController_NumeroAccident =
      TextEditingController();
  TextEditingController? TextController_plaqueMatricule =
      TextEditingController();
  TextEditingController? TextController_anneeModeleCar =
      TextEditingController();
  TextEditingController? TextController_cylindre = TextEditingController();

  ViewFormAddVehicule({
    super.key,
    required this.TextController_NumeroAccident,
    required this.TextController_plaqueMatricule,
    required this.TextController_anneeModeleCar,
    required this.TextController_cylindre,
  });

  @override
  State<ViewFormAddVehicule> createState() => _ViewFormAddVehiculeState();
}

class _ViewFormAddVehiculeState extends State<ViewFormAddVehicule> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
