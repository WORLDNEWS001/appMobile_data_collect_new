
/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

import 'dart:convert';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';



class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<SmsMessage> messages = [];
  var numTelAgent = "+237659403009";

  @override
  void initState() {
    super.initState();
    //_getSmsMessages();
    _loadMessagesFromJSON(); // Charger les messages au démarrage de l'application
    SmsReceiver receiver = SmsReceiver();
    receiver.onSmsReceived.listen(onSmsReceived);
  }

  @override
  void onSmsReceived(SmsMessage message) {
    if (message.address == numTelAgent) {
      setState(() {
        messages.add(message);
        _saveMessagesToJSON(); // Enregistrer les messages à chaque nouveau message reçu
      });
    }
  }

  */

/*
  Future<void> _getSmsMessages() async {

    SmsQuery query = SmsQuery();
    List<SmsMessage> smsList = await query.getAllSms;

    List<SmsMessage> filteredList = smsList.where((message) {
      return message.address == numTelAgent;
    }).toList();

    setState(() {
      messages = filteredList;
      print('je recois les sms');
    });

    SmsReceiver receiver  = SmsReceiver();
    try{
      receiver.onSmsReceived.listen((SmsMessage message) {
        setState(() {
          if(message.address == numTelAgent){
            messages.add(message);
            print('je recois les sms');
            _saveMessagesToJSON(); // Enregistrer les messages à chaque nouveau message reçu
          }else{
            null;
          }
        });
      });
    }catch(e){
      print ("erreur produite $e");
    }

  }*/











/*


  Future<void> _saveMessagesToJSON() async {
    try {

      // Convertir la liste des messages en une liste de Map<String, dynamic>
      List<Map<String, dynamic>> messagesData = messages.map((message) {
        return {
          'address': message.address,
          'body': message.body,
        };
      }).toList();
      // Obtenir le répertoire de documents
      String directory = '/storage/sdcard0/testappsms/';
      String filePath = directory + 'messages.json';
      File file = File(filePath);

      // Enregistrer les données des messages dans le fichier messages.json

      String jsonContent = json.encode(messages);
      file.writeAsString(jsonContent);

      print (jsonContent);
      print (messagesData);



    } catch (e) {
      print('Erreur lors de l\'enregistrement des messages : $e');

    }
  }

  Future<void> _loadMessagesFromJSON() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/messages.json');

      // Lire le contenu du fichier JSON
      final jsonString = await file.readAsString();

      // Convertir le JSON en une liste de messages
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      final loadedMessages = jsonList.map((json) => SmsMessage.fromJson(json)).toList();

      setState(() {
        messages = loadedMessages;
        print ("loadedMessages");
      });

      print('Messages chargés à partir du fichier JSON.');
    } catch (e) {
      print('Erreur lors du chargement des messages : $e');
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS Messages'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title:   Text(messages[index].address ?? ''),
            subtitle: Text(messages[index].body ?? ''),
          );
        },
      ),
    );
  }

}

*/
