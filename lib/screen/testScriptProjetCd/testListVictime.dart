import 'package:flutter/material.dart';

class listVictimeRecord extends StatelessWidget {
  const listVictimeRecord({Key? key}) : super(key: key);

  String TextTitle(){
    return "List Victimes";
  }

  @override
  Widget build(BuildContext context) {



    return Container();

    /*
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[

          SizedBox(height: 5),
          Card(

            margin: EdgeInsets.symmetric(horizontal: 15),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            child: SizedBox(
              width: MediaQuery.of(context).size.width ,

              child: Column(
                children: <Widget> [
                  ListTile(
                    title: Text(
                      "Hopital La Quintini",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Wrap (
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.symmetric(vertical:12 ),

                          child: Text("Situer A : Akwa-Antenne Crtv"),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 110,
                            height: 35,
                            padding: EdgeInsets.symmetric(vertical:5 ),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.share_location_rounded,
                                      color: Colors.black54,
                                      size: 25,),
                                    Text(
                                      "itinéraire",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),



                    trailing: SizedBox(
                      height: 200,
                      child: Container(
                        height: 500,
                        //radius: 25,
                        //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                        child:   Stack(
                          children: [
                            Container(
                              width: 50,
                              child: Card(
                                child:
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                                  radius: 25,
                                ),
                                elevation: 4,
                                shape: CircleBorder(),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),

                  Wrap(
                    runSpacing: 12,
                    spacing: 12.0,
                    //crossAxisAlignment: WrapCrossAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[200],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 1 (03)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 2 (02 person)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[600],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 3 (01)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),

                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[900],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 4 (05)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 110,
                          height: 35,
                          padding: EdgeInsets.symmetric(vertical:12 ),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.remove_red_eye_sharp,
                                    color: Colors.black54,
                                    size: 16.0,),

                                  Text(
                                    "Voir Plus ...",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),
          //------------------------------------------------------------------///////  Reapeat my frame



          Card(

            margin: EdgeInsets.symmetric(horizontal: 15),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            child: SizedBox(
              width: MediaQuery.of(context).size.width ,

              child: Column(
                children: <Widget> [
                  ListTile(
                    title: Text(
                      "Hopital La Quintini",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Wrap (
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.symmetric(vertical:12 ),

                          child: Text("Situer A : Akwa-Antenne Crtv"),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 110,
                            height: 35,
                            padding: EdgeInsets.symmetric(vertical:5 ),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.share_location_rounded,
                                      color: Colors.black54,
                                      size: 25,),
                                    Text(
                                      "itinéraire",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),



                    trailing: SizedBox(
                      height: 200,
                      child: Container(
                        height: 500,
                        //radius: 25,
                        //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                        child:   Stack(
                          children: [
                            Container(
                              width: 50,
                              child: Card(
                                child:
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                                  radius: 25,
                                ),
                                elevation: 4,
                                shape: CircleBorder(),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),

                  Wrap(
                    runSpacing: 12,
                    spacing: 12.0,
                    //crossAxisAlignment: WrapCrossAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[200],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 1 (03)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 2 (02 person)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[600],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 3 (01)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),

                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[900],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 4 (05)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 110,
                          height: 35,
                          padding: EdgeInsets.symmetric(vertical:12 ),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.remove_red_eye_sharp,
                                    color: Colors.black54,
                                    size: 16.0,),

                                  Text(
                                    "Voir Plus ...",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),

          Card(

            margin: EdgeInsets.symmetric(horizontal: 15),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            child: SizedBox(
              width: MediaQuery.of(context).size.width ,

              child: Column(
                children: <Widget> [
                  ListTile(
                    title: Text(
                      "Hopital La Quintini",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Wrap (
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.symmetric(vertical:12 ),

                          child: Text("Situer A : Akwa-Antenne Crtv"),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 110,
                            height: 35,
                            padding: EdgeInsets.symmetric(vertical:5 ),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.share_location_rounded,
                                      color: Colors.black54,
                                      size: 25,),
                                    Text(
                                      "itinéraire",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),



                    trailing: SizedBox(
                      height: 200,
                      child: Container(
                        height: 500,
                        //radius: 25,
                        //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                        child:   Stack(
                          children: [
                            Container(
                              width: 50,
                              child: Card(
                                child:
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                                  radius: 25,
                                ),
                                elevation: 4,
                                shape: CircleBorder(),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),

                  Wrap(
                    runSpacing: 12,
                    spacing: 12.0,
                    //crossAxisAlignment: WrapCrossAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[200],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 1 (03)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 2 (02 person)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[600],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 3 (01)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),

                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[900],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 4 (05)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 110,
                          height: 35,
                          padding: EdgeInsets.symmetric(vertical:12 ),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.remove_red_eye_sharp,
                                    color: Colors.black54,
                                    size: 16.0,),

                                  Text(
                                    "Voir Plus ...",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),

          Card(

            margin: EdgeInsets.symmetric(horizontal: 15),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            child: SizedBox(
              width: MediaQuery.of(context).size.width ,

              child: Column(
                children: <Widget> [
                  ListTile(
                    title: Text(
                      "Hopital La Quintini",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Wrap (
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.symmetric(vertical:12 ),

                          child: Text("Situer A : Akwa-Antenne Crtv"),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 110,
                            height: 35,
                            padding: EdgeInsets.symmetric(vertical:5 ),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.share_location_rounded,
                                      color: Colors.black54,
                                      size: 25,),
                                    Text(
                                      "itinéraire",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),



                    trailing: SizedBox(
                      height: 200,
                      child: Container(
                        height: 500,
                        //radius: 25,
                        //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                        child:   Stack(
                          children: [
                            Container(
                              width: 50,
                              child: Card(
                                child:
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                                  radius: 25,
                                ),
                                elevation: 4,
                                shape: CircleBorder(),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),

                  Wrap(
                    runSpacing: 12,
                    spacing: 12.0,
                    //crossAxisAlignment: WrapCrossAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[200],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 1 (03)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 2 (02 person)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[600],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 3 (01)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),

                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[900],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 4 (05)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 110,
                          height: 35,
                          padding: EdgeInsets.symmetric(vertical:12 ),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.remove_red_eye_sharp,
                                    color: Colors.black54,
                                    size: 16.0,),

                                  Text(
                                    "Voir Plus ...",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),

          Card(

            margin: EdgeInsets.symmetric(horizontal: 15),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            child: SizedBox(
              width: MediaQuery.of(context).size.width ,

              child: Column(
                children: <Widget> [
                  ListTile(
                    title: Text(
                      "Hopital La Quintini",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Wrap (
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.symmetric(vertical:12 ),

                          child: Text("Situer A : Akwa-Antenne Crtv"),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 110,
                            height: 35,
                            padding: EdgeInsets.symmetric(vertical:5 ),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.share_location_rounded,
                                      color: Colors.black54,
                                      size: 25,),
                                    Text(
                                      "itinéraire",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),



                    trailing: SizedBox(
                      height: 200,
                      child: Container(
                        height: 500,
                        //radius: 25,
                        //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                        child:   Stack(
                          children: [
                            Container(
                              width: 50,
                              child: Card(
                                child:
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                                  radius: 25,
                                ),
                                elevation: 4,
                                shape: CircleBorder(),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),

                  Wrap(
                    runSpacing: 12,
                    spacing: 12.0,
                    //crossAxisAlignment: WrapCrossAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[200],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 1 (03)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 2 (02 person)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[600],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 3 (01)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),

                      Wrap(
                        children: <Widget>[
                          Container(
                            width: 20,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red[900],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Niveau 4 (05)",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 110,
                          height: 35,
                          padding: EdgeInsets.symmetric(vertical:12 ),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.remove_red_eye_sharp,
                                    color: Colors.black54,
                                    size: 16.0,),

                                  Text(
                                    "Voir Plus ...",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          SizedBox(height: 15,),


          //---------------------------------------------------//////// End Reapeat my frame ---------------
        ],
      ),
    );
    */
  }
}
