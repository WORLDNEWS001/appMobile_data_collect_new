import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';


class JsonFileManager {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> _localFile({required String nameFileJson}) async {
    final path = await _localPath;
    return File('$path/$nameFileJson.json');
  }

  static Future<void> writeToJson({required Map<String, dynamic>? data, required String nameFileJson} ) async {
    final file = await _localFile(nameFileJson: nameFileJson);
    print("---Emplacement Memoire d'ecriture de ce Json File--  =  $file");
    final jsonString = jsonEncode(data);
    await file.writeAsString(jsonString);
  }

  static Future<Map<String, dynamic>> readFromJson({required String nameFileJson}) async {
    try {
      final file = await _localFile(nameFileJson: nameFileJson);
      String content = await file.readAsString();
      return jsonDecode(content);
    } catch (e) {
      return {}; // Retourne un objet vide si le fichier n'existe pas ou s'il y a une erreur de lecture.
    }
  }
}

