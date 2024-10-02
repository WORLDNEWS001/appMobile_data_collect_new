import 'package:flutter/material.dart';
import 'package:secondtest/widgets/recordNewEnquete/recordPersonAccidente.dart';

class testing extends StatefulWidget {
  const testing({Key? key}) : super(key: key);

  @override
  State<testing> createState() => _testingState();
}

class _testingState extends State<testing> {









  @override
  void initState() {
  super.initState();

  }


  void onpressor (){

  }




  Widget build(BuildContext context) {




    return  Container(
      child: ElevatedButton.icon(
        onPressed: main,
        icon: Icon(Icons.arrow_circle_left_outlined,
            size: 50),
        label: Text('Retour'),
      ),
    );
  }
}


void main() {
  /*Actionari redaction = Actionari();

  redaction.someActiona();
  print("je suis dans le void main ");*/
}