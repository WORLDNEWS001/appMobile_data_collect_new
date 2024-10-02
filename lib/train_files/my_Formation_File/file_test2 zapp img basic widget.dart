

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'les widget basiques',
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home: Home() ,
    );
    //throw UnimplementedError();
  }




}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Home();
    //throw UnimplementedError();
  }

}

class _Home extends State<Home>{
  bool oui=false;
  var numActeurs=1;
  late double largeur;
  @override
  Widget build(BuildContext context) {
    largeur =MediaQuery.of(context).size.width;
    //double hauteure =MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        title: Text ('Page Accueil'),
        leading: Icon(Icons.account_circle),
        actions: <Widget>[
          Icon(Icons.access_alarm),
          Icon(Icons.bluetooth),
          Icon(Icons.surround_sound),
        ],
        elevation: 10.0,
      ),
      body: Container(

        color: Colors.blue,
        //margin: EdgeInsets.only(top: 20.0, bottom: 20),
        child: Center(
            child: Card (
              elevation: 20.0,
              color: Colors.white,
              child: Container(
                  width: MediaQuery.of(context).size.width /1.2,
                  height: MediaQuery.of(context).size.height /1.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Les Acteur de Doser',
                        style: TextStyle(
                          color: (oui) ? Colors.blue : Colors.orange,
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextButton(
                        onPressed: boutonAppuye,
                        child: Text("Appuis Ici",
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      ElevatedButton(onPressed: boutonAppuye, child: Text("Bouton Elever")),


                      Card(
                        elevation: 15.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width /2.5,
                          height: MediaQuery.of(context).size.height /15,
                          child: Image.asset(
                            'assets/images/doserLogoSingle.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 15.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width /2.5,
                          height: MediaQuery.of(context).size.height /15,
                          child: Image.asset(
                            'assets/images/acteursdoser/$numActeurs.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 15.0,
                        child: Container(
                            width: MediaQuery.of(context).size.width /1.5,
                            height: MediaQuery.of(context).size.height /15,
                            child: Row (
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget> [
                                IconButton(
                                    onPressed: (){
                                      print("Bouton Ajouter appuyer");
                                      setState(() {
                                        oui = !oui;
                                        boutonAppuye();
                                      });
                                    },
                                    icon: Icon(Icons.add_chart,
                                        color: Colors.blue,
                                        size: MediaQuery.of(context).size.height/20 )
                                ),
                                IconButton(
                                    onPressed: (){
                                      print("Bouton Delete appuyer");
                                    },
                                    icon: Icon(Icons.delete_forever_rounded,
                                        color: Colors.red,
                                        size: MediaQuery.of(context).size.height/20 )
                                )

                              ],
                            )
                        ),
                      ),

                      Container(
                        height: largeur / 15,
                        color: Colors.indigo,
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget>[
                            Icon(Icons.thumb_down,
                                color: Colors.red,
                                size: largeur/20),
                            Icon(Icons.start,
                                color: Colors.white,
                                size: largeur/20),
                            Icon(Icons.thumb_up_alt_outlined,
                                color: Colors.green,
                                size: largeur/20),

                            Card(
                              elevation: 20.0,
                              color: Colors.lightBlueAccent,
                              child: Container(
                                width: MediaQuery.of(context).size.width /6,
                                height: largeur/20,
                                //color: Colors.lightBlueAccent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    Icon(Icons.access_alarm,
                                      color: Colors.white,
                                      size: largeur/20,
                                    ),

                                    Text("20:22",
                                      style: TextStyle(
                                        color: Colors.lime,
                                        fontSize: largeur/30,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              ),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: boutonAppuye,
        elevation: 10,
        tooltip: "changer image acteur",
        child: Icon(Icons.skip_next_outlined),
        hoverElevation: 50.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    // throw UnimplementedError();
  }

  void boutonAppuye(){
    setState(() {
      numActeurs++;
      print("la largeur divice est $largeur, largeur contain is ${MediaQuery.of(context).size.width} et hauteur  contain is ${MediaQuery.of(context).size.height}");
      (numActeurs>10)? numActeurs=1 :null ;
    });
  }

}