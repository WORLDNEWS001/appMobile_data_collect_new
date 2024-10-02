
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtest/model/provider/create_pv_provider/ProviderCreatePv.dart';

class ViewFormCreatePv extends StatefulWidget {

  //-- declarer une attribut fonction
  Function() onSaveDataPvAndSendRequest;
  Function() initDataExecuteGet;
  String? dateAccident;
  String? timeAccident;
  int? idEnquete;


  ViewFormCreatePv({
    super.key,
    required this.onSaveDataPvAndSendRequest,
    required this.initDataExecuteGet,
    this.dateAccident,
    this.timeAccident,
    this.idEnquete,
  });

  @override
  State<ViewFormCreatePv> createState() => _ViewFormCreatePvState();
}

class _ViewFormCreatePvState extends State<ViewFormCreatePv> {

  TextEditingController? controllerDate = TextEditingController();
  TextEditingController? controllerHeure = TextEditingController();

  TextEditingController? controllerPatrouille = TextEditingController();
  TextEditingController? controllerInfoNous = TextEditingController();
  TextEditingController? controllerInfoAssisteDe = TextEditingController();
  TextEditingController? controllerInfoAvonsConstate = TextEditingController();
  TextEditingController? controllerInfoDeLaCirculationSurvenu = TextEditingController();

  ProviderCreatePv? providerCreatePv;





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerDate = TextEditingController(text: widget.dateAccident);
    controllerHeure = TextEditingController(text: widget.timeAccident);

    providerCreatePv= context.read<ProviderCreatePv>();



  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    providerCreatePv= context.watch<ProviderCreatePv>();

    controllerDate = providerCreatePv?.controllerDateProvider;
    controllerHeure = providerCreatePv?.controllerHeureProvider;

    controllerPatrouille = providerCreatePv?.controllerPatrouilleProvider;
    controllerInfoNous = providerCreatePv?.controllerInfoNousProvider;
    controllerInfoAssisteDe = providerCreatePv?.controllerInfoAssisteDeProvider;
    controllerInfoAvonsConstate = providerCreatePv?.controllerInfoAvonsConstateProvider;
    controllerInfoDeLaCirculationSurvenu = providerCreatePv?.controllerInfoDeLaCirculationSurvenuProvider;

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Constituer le Pv'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child:Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 15,),

                Column(
                  children: [
                    Text("Date de l'accident",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 2),
                    TextFormField(
                      controller: controllerDate,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month),
                        border: OutlineInputBorder(),
                        labelText: "Date de l'accident", ),
                      onChanged: (value){

                      },
                    ),
                  ]
                ),

                SizedBox(height: 5,),

                Column(
                    children: [
                      Text("Heure de l'accident",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 2),
                      TextFormField(
                        controller: controllerHeure,
                        readOnly: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.access_time_filled_sharp),
                          border: OutlineInputBorder(),
                          labelText: "Heure de l'accident", ),
                        onChanged: (value){

                        },
                      ),
                    ]
                ),


                SizedBox(height: 5,),

                Column(
                    children: [
                      Text("La Patrouille : ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 2),

                      //------ Add RichText input ------
                      TextFormField(
                        controller: controllerPatrouille,
                        readOnly: false,
                        maxLines: null,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "La Patrouille ", ),
                        onChanged: (value){

                        },
                      ),
                    ]
                ),

                SizedBox(height: 15,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nous : ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 2),

                      //------ Add RichText input ------
                      TextFormField(
                        controller: controllerInfoNous,
                        readOnly: false,
                        maxLines: null,
                        minLines: 3,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),

                           ),
                        onChanged: (value){

                        },
                      ),
                    ]
                ),



                SizedBox(height: 10,),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Assisté De : ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 2),

                      //------ Add RichText input ------
                      TextFormField(
                        controller: controllerInfoAssisteDe,
                        readOnly: false,
                        maxLines: null,
                        minLines: 3,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){

                        },
                      ),
                    ]
                ),


                SizedBox(height: 10,),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Avons constate Accident : ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 2),

                      //------ Add RichText input ------
                      TextFormField(
                        controller: controllerInfoAvonsConstate,
                        readOnly: false,
                        maxLines: null,
                        minLines: 5,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.bookmark_add),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){

                        },
                      ),
                    ]
                ),

                SizedBox(height: 10,),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("De la circulation survenu : ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 2),

                      //------ Add RichText input ------
                      TextFormField(
                        controller: controllerInfoDeLaCirculationSurvenu,
                        readOnly: false,
                        maxLines: null,
                        minLines: 5,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.bookmark_add),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){

                        },
                      ),
                    ]
                ),

                SizedBox(height: 15,),

                ElevatedButton(
                  onPressed: (){
                    widget.onSaveDataPvAndSendRequest();
                  },
                  child: Text("Enregistrer le Pv"),
                ),

                SizedBox(height: 10,),


              ],
            ),
          ),
        )
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          widget.onSaveDataPvAndSendRequest();
        },
        child: Icon(Icons.check_circle_outline,
                  size: 40,
                  color: Colors.white,
                ),
        backgroundColor: Colors.green,
      )
    );
  }
}
