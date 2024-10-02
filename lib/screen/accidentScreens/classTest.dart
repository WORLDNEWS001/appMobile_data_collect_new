import 'package:flutter/material.dart';


class testStepClass extends StatefulWidget {
  //const testStepClass({Key? key}) : super(key: key);


  const testStepClass({Key? key,required this.onStepUpdated}) : super(key: key);
  final Function(int) onStepUpdated;


  void someAction() {
    // Effectuez l'action qui doit modifier currentStep
    // ...
    print("je suis dans la fonction somme action de Somme Action");
    // Appelez la méthode de rappel pour mettre à jour currentStep dans la page parent
    onStepUpdated(3); // Par exemple, mettez à jour currentStep à 2
  }

  @override
  State<testStepClass> createState() => _testStepClassState();
}

class _testStepClassState extends State<testStepClass> {




  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
