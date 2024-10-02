

import 'package:flutter/material.dart';

class PageListAccident extends StatefulWidget {
  const PageListAccident({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PageListAccident();
    //throw UnimplementedError();
  }


}

class _PageListAccident extends State<PageListAccident> {

  @override
  Widget build(BuildContext context){

    double largeur= MediaQuery.of(context).size.width;
    double hauteur=MediaQuery.of(context).size.height;
    //double screenResolution = largeur* hauteur;
    //double coeficientReduc = 300;
    //double screenResolutionUse =screenResolution ;
    // print("la valeur de la resolution de cette ecran est : $screenResolutionUse");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text ("ENQUÊTE ET ANALYSE D'ACCIDENT",
        style: TextStyle(
          fontSize: 15,
              fontWeight: FontWeight.bold,
        ),),
        leading: Icon(Icons.menu),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: Icon(Icons.notifications_active),
          )

        ],
        elevation: 10.0,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          Container(
            height: hauteur /6,
            decoration: BoxDecoration(
              color: Colors.blue.shade500,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Rapport Accidents",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: largeur / 20,
                    )
                ),
              ],
            ) ,
          )
        ],
      ),
    );
  }
}


