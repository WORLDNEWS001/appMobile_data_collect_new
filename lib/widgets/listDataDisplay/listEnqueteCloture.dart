import 'package:flutter/material.dart';

class enqueteCloturer extends StatelessWidget {
  const enqueteCloturer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enquettes Cloturées'),
      ),
      body:  SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Text("Accident N° 024",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
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
                          "Route Axe Ngaoundere-Bertoua",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("03 Vehicule Accidentés, 06 Victimes"),
                        trailing: SizedBox(
                          height: 200,
                          child: Container(
                            height: 500,
                            //radius: 25,
                            //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                            child:   Stack(
                              children: [
                                Container(
                                  width: 150,
                                  child: Card(
                                    child:
                                    CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/9.png"),
                                      radius: 25,
                                    ),
                                    elevation: 4,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                Positioned(
                                  left: 80, //décalage de 10 pixels à gauche
                                  width: 50,
                                  bottom: 0,
                                  top: 0,
                                  child:  Card(
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/8.png"),
                                      radius: 25,
                                    ),
                                    elevation: 10,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_month,
                                color: Colors.black54 ,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("25/05/2023",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget> [
                              Icon(Icons.access_time,
                                color: Colors.black54,),
                              SizedBox(
                                width:5 ,
                              ),
                              Text(
                                "10:30",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Cloturé",
                                style: TextStyle(
                                    color: Colors.black54
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              //------------------------------------------------------------------///////  Reapeat my frame

              Text("Accident N° 025",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
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
                          "Route Axe Ngaoundere-Bertoua",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("03 Vehicule Accidentés, 06 Victimes"),
                        trailing: SizedBox(
                          height: 200,
                          child: Container(
                            height: 500,
                            //radius: 25,
                            //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                            child:   Stack(
                              children: [
                                Container(
                                  width: 150,
                                  child: Card(
                                    child:
                                    CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/9.png"),
                                      radius: 25,
                                    ),
                                    elevation: 4,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                Positioned(
                                  left: 80, //décalage de 10 pixels à gauche
                                  width: 50,
                                  bottom: 0,
                                  top: 0,
                                  child:  Card(
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/8.png"),
                                      radius: 25,
                                    ),
                                    elevation: 10,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_month,
                                color: Colors.black54 ,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("25/05/2023",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget> [
                              Icon(Icons.access_time,
                                color: Colors.black54,),
                              SizedBox(
                                width:5 ,
                              ),
                              Text(
                                "10:30",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Cloturé",
                                style: TextStyle(
                                    color: Colors.black54
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Text("Accident N° 026",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
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
                          "Route Axe Ngaoundere-Bertoua",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("03 Vehicule Accidentés, 06 Victimes"),
                        trailing: SizedBox(
                          height: 200,
                          child: Container(
                            height: 500,
                            //radius: 25,
                            //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                            child:   Stack(
                              children: [
                                Container(
                                  width: 150,
                                  child: Card(
                                    child:
                                    CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/9.png"),
                                      radius: 25,
                                    ),
                                    elevation: 4,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                Positioned(
                                  left: 80, //décalage de 10 pixels à gauche
                                  width: 50,
                                  bottom: 0,
                                  top: 0,
                                  child:  Card(
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/8.png"),
                                      radius: 25,
                                    ),
                                    elevation: 10,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_month,
                                color: Colors.black54 ,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("25/05/2023",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget> [
                              Icon(Icons.access_time,
                                color: Colors.black54,),
                              SizedBox(
                                width:5 ,
                              ),
                              Text(
                                "10:30",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Cloturé",
                                style: TextStyle(
                                    color: Colors.black54
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Text("Accident N° 027",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
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
                          "Route Axe Ngaoundere-Bertoua",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("03 Vehicule Accidentés, 06 Victimes"),
                        trailing: SizedBox(
                          height: 200,
                          child: Container(
                            height: 500,
                            //radius: 25,
                            //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                            child:   Stack(
                              children: [
                                Container(
                                  width: 150,
                                  child: Card(
                                    child:
                                    CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/9.png"),
                                      radius: 25,
                                    ),
                                    elevation: 4,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                Positioned(
                                  left: 80, //décalage de 10 pixels à gauche
                                  width: 50,
                                  bottom: 0,
                                  top: 0,
                                  child:  Card(
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/8.png"),
                                      radius: 25,
                                    ),
                                    elevation: 10,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_month,
                                color: Colors.black54 ,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("25/05/2023",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget> [
                              Icon(Icons.access_time,
                                color: Colors.black54,),
                              SizedBox(
                                width:5 ,
                              ),
                              Text(
                                "10:30",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Cloturé",
                                style: TextStyle(
                                    color: Colors.black54
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),


              Text("Accident N° 028",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
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
                          "Route Axe Ngaoundere-Bertoua",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("03 Vehicule Accidentés, 06 Victimes"),
                        trailing: SizedBox(
                          height: 200,
                          child: Container(
                            height: 500,
                            //radius: 25,
                            //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                            child:   Stack(
                              children: [
                                Container(
                                  width: 150,
                                  child: Card(
                                    child:
                                    CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/9.png"),
                                      radius: 25,
                                    ),
                                    elevation: 4,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                Positioned(
                                  left: 80, //décalage de 10 pixels à gauche
                                  width: 50,
                                  bottom: 0,
                                  top: 0,
                                  child:  Card(
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/8.png"),
                                      radius: 25,
                                    ),
                                    elevation: 10,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_month,
                                color: Colors.black54 ,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("25/05/2023",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget> [
                              Icon(Icons.access_time,
                                color: Colors.black54,),
                              SizedBox(
                                width:5 ,
                              ),
                              Text(
                                "10:30",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Cloturé",
                                style: TextStyle(
                                    color: Colors.black54
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),


              Text("Accident N° 029",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
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
                          "Route Axe Ngaoundere-Bertoua",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("03 Vehicule Accidentés, 06 Victimes"),
                        trailing: SizedBox(
                          height: 200,
                          child: Container(
                            height: 500,
                            //radius: 25,
                            //backgroundImage: AssetImage("assets/images/acteursdoser/6.png"),
                            child:   Stack(
                              children: [
                                Container(
                                  width: 150,
                                  child: Card(
                                    child:
                                    CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/9.png"),
                                      radius: 25,
                                    ),
                                    elevation: 4,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                Positioned(
                                  left: 80, //décalage de 10 pixels à gauche
                                  width: 50,
                                  bottom: 0,
                                  top: 0,
                                  child:  Card(
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/acteursdoser/8.png"),
                                      radius: 25,
                                    ),
                                    elevation: 10,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_month,
                                color: Colors.black54 ,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("25/05/2023",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget> [
                              Icon(Icons.access_time,
                                color: Colors.black54,),
                              SizedBox(
                                width:5 ,
                              ),
                              Text(
                                "10:30",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Cloturé",
                                style: TextStyle(
                                    color: Colors.black54
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),












              //---------------------------------------------------//////// End Reapeat my frame ---------------
            ],
          ),
        ),
      )
    );

  }
}
