
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});


  @override
  State<FormScreen>  createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen>{

  final _formfield = GlobalKey<FormState>();
  final nameUserControler = TextEditingController();
  final passControler = TextEditingController();
  bool passToggle = true;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/doserLogo.png",
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: nameUserControler,
                  decoration: InputDecoration(
                    labelText: "Nom Utilisateur",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value){

                    if(value!.isEmpty){
                      return "Entrez le nom utilisateur";
                    }

                    },
                ),

                SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passControler,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                      labelText: "Mot De Passe",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Password";
                    }
                    else if(passControler.text.length < 6){
                      return "le mot de passe doit etre au moins 6 caractere";
                    }
                  },
                ),
                SizedBox(height: 60,),
                InkWell(
                  onTap: (){
                    if(_formfield.currentState!.validate()){
                      print("Success");
                      print("le nameUsercontroler est $nameUserControler");
                      print("le passwordControler est $passControler");

                      nameUserControler.clear();
                      passControler.clear();
                    }

                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text("Log In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account ?",
                      style:
                      TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text(
                        "Signalez",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}