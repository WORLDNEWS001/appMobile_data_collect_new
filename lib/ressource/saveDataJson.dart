

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class JsonFileManager {
  String? fileName;

  JsonFileManager(String fileName) {
    this.fileName = fileName;
  }

  Future<void> createFileDataJson() async {
    Directory? downloadDirectory = await getExternalStorageDirectory();
    String downloadPath = downloadDirectory!.path;
    String filePath = '$downloadPath/$fileName';

    File jsonFile = File(filePath);
    if (!await jsonFile.exists()) {
      await jsonFile.create(recursive: true);
      print('Nouveau fichier JSON créé : $fileName');
    } else {
      print('Le fichier JSON $fileName existe déjà.');
    }
  }

  Future<void> writeDataJson(Map<String, dynamic> jsonData) async {
    Directory? downloadDirectory = await getExternalStorageDirectory();
    String downloadPath = downloadDirectory!.path;
    String filePath = '$downloadPath/$fileName';

    File jsonFile = File(filePath);
    if (!await jsonFile.exists()) {
      print('Le fichier JSON $fileName n\'existe pas. Veuillez le créer d\'abord.');
      return;
    }

    await jsonFile.writeAsString(jsonEncode(jsonData));
    print('Données écrites dans le fichier JSON : $fileName');
  }

  /*Future<void> addData(Map<String, dynamic> jsonData) async {
    Directory? downloadDirectory = await getExternalStorageDirectory();
    String downloadPath = downloadDirectory!.path;
    String filePath = '$downloadPath/$fileName';

    File jsonFile = File(filePath);
    if (!await jsonFile.exists()) {
      print('Le fichier JSON $fileName n\'existe pas. Veuillez le créer d\'abord.');
      return;
    }

    String fileContent = await jsonFile.readAsString();
    Map<String, dynamic> existingData = jsonDecode(fileContent);
    existingData.addAll(jsonData);

    await jsonFile.writeAsString(jsonEncode(existingData));
    print('Données ajoutées et mises à jour dans le fichier JSON : $fileName');
  } */

  Future<void> addData(Map<String, dynamic> jsonData) async {
    Directory? downloadDirectory = await getExternalStorageDirectory();
    String downloadPath = downloadDirectory!.path;
    String filePath = '$downloadPath/$fileName';

    File jsonFile = File(filePath);
    if (!await jsonFile.exists()) {
      print('Le fichier JSON $fileName n\'existe pas. Veuillez le créer d\'abord.');
      return;
    }

    String fileContent = await jsonFile.readAsString();
    Map<String, dynamic> existingData = jsonDecode(fileContent);
    existingData.addAll(jsonData);

    await jsonFile.writeAsString(jsonEncode(existingData));
    print('Données ajoutées et mises à jour dans le fichier JSON : $fileName');
  }



  Future<Map<String, dynamic>> getDataJson() async {
    Directory? downloadDirectory = await getExternalStorageDirectory();
    String downloadPath = downloadDirectory!.path;
    String filePath = '$downloadPath/$fileName';

    File jsonFile = File(filePath);
    if (!await jsonFile.exists()) {
      print('Le fichier JSON $fileName n\'existe pas. Veuillez le créer d\'abord.');
      return {};
    }

    String fileContent = await jsonFile.readAsString();
    Map<String, dynamic> jsonData = jsonDecode(fileContent);
    return jsonData;
  }

}

void main() {
  JsonFileManager jsonManager = JsonFileManager('data.json');

  jsonManager.createFileDataJson();

  Map<String, dynamic> data = {
    'name': 'John Doe',
    'age': 30,
    'email': 'johndoe@example.com',
  };

  jsonManager.writeDataJson(data);

  Map<String, dynamic> additionalData = {
    'address': '123 Main St',
    'phone': '555-1234',
  };

  jsonManager.addData(additionalData);
}


