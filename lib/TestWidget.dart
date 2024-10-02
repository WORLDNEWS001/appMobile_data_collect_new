
import 'package:flutter/material.dart';
import 'package:secondtest/View/Formulaires_Enquete/View_Dialog/show_one_show_dialog.dart';

import 'View/Liste_Accident/Tile_One_Accident/Profil_Image_Accident.dart';

class TestWidget extends StatefulWidget {

  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TEST WIDGET"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Bonjour Testeur de Widget Cree par Joel",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Colors.orange,
                //backgroundColor: Colors.black,
                  ),
              ),



              ProfilImageAccident(url_image: "https://www.francebleu.fr/s3/cruiser-production/2023/11/30db61f6-c33f-4694-a782-2d788d11e242/300x169_sc_844353-pgt8icoxk7-whr.jpg"),

              OneShowDialog(),
              
            ],
         ),
        ),
      ),
    );
  }
}
