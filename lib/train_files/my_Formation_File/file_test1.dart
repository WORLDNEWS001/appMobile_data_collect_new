

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
  @override
  Widget build(BuildContext context) {

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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width /1.5,
                          height: MediaQuery.of(context).size.height /6,
                          child: Image.network('https://zupimages.net/up/23/17/5c1a.png',
                              fit: BoxFit.contain),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width /7,
                          height: MediaQuery.of(context).size.height /10,
                          child: Image.network('https://zupimages.net/up/23/17/akcv.png'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height /20,
                          margin: EdgeInsets.only(left: 20.0, right: 20),
                          //color: Colors.white,
                          child: const Center (
                            child: Text (
                              "Start Save Data ",
                              textAlign: TextAlign.end,
                              textScaleFactor: 0.5,
                              style: TextStyle(
                                  fontSize: 100.0,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2 ,
                            height: MediaQuery.of(context).size.height /5,
                            //color: Colors.white,
                            child: Image.asset("assets/images/doserLogoSingle.png",
                              fit: BoxFit.contain,)
                        )
                      ]
                  )
              ),
            )
        ),
      ),
    );
    // throw UnimplementedError();
  }

}


