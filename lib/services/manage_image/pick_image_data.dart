
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:secondtest/VariableData.dart';
import 'package:secondtest/View/my_dialog_loader.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Images.dart';
import 'package:secondtest/services/enquete/images_crash_enquete/MethodeAddImageCrashEnquete.dart';

class PickImageData {
  BuildContext? context;

  PickImageData({
    this.context,
    this.ListPathImages,
  }) {
    requestAllPermissionStorage();
    if(ListPathImages == null){
      ListPathImages = [];
    } else {
      convertStringPathToXfile(ListPathImages!);
    }
  }

  List<XFile>? imageXfile;
  ImagePicker imagePickerInstance = ImagePicker();
  File? fileImage;
  List<String>? ListPathImages;
  List<Images>? listImagesSend = [];

  setListImagesSend(List<Images>? listImages) {
    if (listImages == null) {
      return;
    } else {
      listImagesSend = listImages;
      ListPathImages = listImagesSend?.map((e) => e.path!).toList();
    }
  }

  pickImageGallerie({required BuildContext context}) async {
    final List<XFile>? selectedImages =
        await imagePickerInstance.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      imageXfile?.addAll(selectedImages);
      for (XFile image in selectedImages) {
        MyDialogLoader.showLoadingDialog(context, "Chargement de l'image");

        String pathImageCompress = await compressAndSavePathImage(imageFile: image);
        ListPathImages?.add(pathImageCompress);

        await MyDialogLoader.hideLoadingDialog(context);

        if (isConnected) {
          print(
              '\n\n\nle telephone est connecter a internet et le Path de cette Images:\n $pathImageCompress \n\n\n');
          Images? imageSendTakeRequest = await MethodeAddImageCrashEnquete()
              .AddImageCrash(
                  pathImageCrash: pathImageCompress, context: context);

          if (imageSendTakeRequest == null) {
            print(
                '\n\n\n --------- //***  le telephone est connecter mais la requette serveur d ajout image en ligne a echoue :\n $pathImageCompress \n\n\n');
            Images imageSendOut = Images(path: pathImageCompress);
            listImagesSend?.add(imageSendOut);
          } else {
            print(
                '\n\n\n --------- //***  le telephone Est  connecter a internet, Requette Add Image Crash Reussi nouveau Path Serveur :\n name : ${imageSendTakeRequest.name} \n path : ${imageSendTakeRequest.path} \n\n\n');
            listImagesSend?.add(imageSendTakeRequest);
            //print("Liste des images envoyées : $listImagesSend");
            //Logger().e("\n\n\nListe des images envoyées : $listImagesSend \n\n\n");
          }
        } else {
          print(
              '\n\n\n --------- //***  le telephone n est pas connecter a internet et le Path de cette Images:\n $pathImageCompress \n\n\n');
          Images imageSend = Images(path: pathImageCompress);
          listImagesSend?.add(imageSend);
        }
      }
    }
  }

  Future<List<String>?> pickImageCamera({required BuildContext context}) async {
    final XFile? CaptureImage =
        await imagePickerInstance.pickImage(source: ImageSource.camera);
    if (CaptureImage != null) {
      MyDialogLoader.showLoadingDialog(context, "Chargement de l'image");

      imageXfile?.add(CaptureImage);
      String pathImageCompress = await compressAndSavePathImage(imageFile: CaptureImage);
      ListPathImages?.add(pathImageCompress);

      await MyDialogLoader.hideLoadingDialog(context);

      if (isConnected) {
        print(
            '\n\n\nle telephone est connecter a internet et le Path de cette Images:\n $pathImageCompress \n\n\n');
        Images? imageSendTakeRequest = await MethodeAddImageCrashEnquete()
            .AddImageCrash(pathImageCrash: pathImageCompress, context: context);

        if (imageSendTakeRequest == null) {
          print(
              '\n\n\n --------- //***  le telephone est connecter mais la requette serveur d ajout image en ligne a echoue :\n $pathImageCompress \n\n\n');
          Images imageSendOut = Images(path: pathImageCompress);
          listImagesSend?.add(imageSendOut);
        } else {
          print(
              '\n\n\n --------- //***  le telephone Est  connecter a internet, Requette Add Image Crash Reussi nouveau Path Serveur :\n name : ${imageSendTakeRequest.name} \n path : ${imageSendTakeRequest.path} \n\n\n');

          listImagesSend?.add(imageSendTakeRequest);
          //print("Liste des images envoyées : $listImagesSend");
          //Logger().e("\n\n\nListe des images envoyées listImagesSend : $listImagesSend \n\n alorsque imageSendTakeRequest est : $imageSendTakeRequest  \n\n\n");
        }
      } else {
        print(
            '\n\n\n --------- //***  le telephone n est pas connecter a internet et le Path de cette Images:\n $pathImageCompress \n\n\n');
        Images imageSend = Images(path: pathImageCompress);
        listImagesSend?.add(imageSend);
      }

      return ListPathImages;
    }
  }

  ///------ methode to pick one image camera instant and return the path of the image
  Future<String?> pickOneImageCamera({required BuildContext context}) async {
    final XFile? CaptureImage =
    await imagePickerInstance.pickImage(source: ImageSource.camera);
    if (CaptureImage != null) {
      MyDialogLoader.showLoadingDialog(context, "Chargement de l'image Pour le Croquis");

      imageXfile?.add(CaptureImage);
      String pathImageCompress = await compressAndSavePathImage(imageFile: CaptureImage);
      await MyDialogLoader.hideLoadingDialog(context);

      return pathImageCompress;
    }
  }




  Future<String> compressAndSavePathImage({
    required XFile imageFile,
    String? nameFileCustom,
    String? namePathSaveCustom,
    bool isCompress = true,
  }) async {


    // Récupération du poids de l'image avant la compression
    File originalImageFile = File(imageFile.path);
    double originalSizeInBytes = originalImageFile.lengthSync() / (1024 * 1024); // Convertir en Mo
    print("\n  ------------------ Taille de l'image avant la compression : ===  $originalSizeInBytes Mo  ------------------ \n");

    List<int>? compressedBytes;
    if(isCompress){
      // Compression de l'image
      compressedBytes = await FlutterImageCompress.compressWithList(
        await imageFile.readAsBytes(),
        //minHeight: 1920, // La hauteur maximale de l'image compressée
        //minWidth: 1080, // La largeur maximale de l'image compressée
        minHeight: 1280,
        // La hauteur maximale de l'image compressée
        minWidth: 720,
        // La largeur maximale de l'image compressée
        quality: 30,
        // La qualité de compression (0 - 100)
        //format: CompressFormat.png, // Le format de compression (jpeg ou png)
        format: CompressFormat.jpeg,
        // Le format de compression (jpeg ou png)

        //autoCorrectionAngle: true, // Corriger l'angle de rotation de l'image
        //rotate: 0, // Appliquer une rotation arbitraire à l'image
        keepExif: true,

        //includeExif: true, // Conserver les données EXIF de l'image
      );

    }else{
      compressedBytes = await imageFile.readAsBytes();
    }

    // Récupération du répertoire de documents
    Directory? documentsDirectory = await getExternalStorageDirectory();
    // Obtenez le chemin complet
    String fullPath = documentsDirectory!.path;
    // Obtenez le préfixe souhaité
    String prefix = fullPath.substring(0, fullPath.indexOf('/Android/'));
    print("le prefixe sous android retrouver est de  ----> ${prefix}  <----");

    String namePathDefault = "File_Image";
    // Création du chemin d'enregistrement de l'image
    if(namePathSaveCustom != null){
      namePathDefault = "${namePathDefault}/${namePathSaveCustom}";
    }
    String? PathSaveData = await CheckPathAndCreateIfNoExist("${namePathDefault}");

    print("\n  ++++++++++++++++++++++++ Le documentsPath de sauvegarde Image est de ===  ${PathSaveData}  ------------ \n");

    // Création du chemin d'enregistrement avec une extension png (ou jpg selon le format)
    String? nameFileDefault = "${DateTime.now().millisecondsSinceEpoch}";
    if(nameFileCustom != null){
      nameFileDefault = "${nameFileCustom}";
    }
    String imagePath = '$PathSaveData/${nameFileDefault}.png';

    // Sauvegarde de l'image compressée
    await File(imagePath).writeAsBytes(compressedBytes);

    print("\n  ++++++++++++++++++++++++ Le CHEMIN COMPLET DE  Image est de ===  ${imagePath}  ------------ \n");


    // Récupération du poids de l'image après la compression
    double compressedSizeInBytes = File(imagePath).lengthSync() / (1024 * 1024); // Convertir en Mo
    print("\n  ------------------ Taille de l'image après la compression : $compressedSizeInBytes Mo  ------------------ \n");


    if(imagePath != null ){
      return imagePath;
    }else{
      return "";
    }


  }



  Future<String?> CheckPathAndCreateIfNoExist(String namePath) async {

    Directory? documentsDirectory =  await getExternalStorageDirectory();
    String fullPath = documentsDirectory!.path;
    String prefix = fullPath.substring(0, fullPath.indexOf('/Android/'));
    print("le prefixe sous android retrouver est de  ----> ${prefix}  <----");
    String PathSaveData = "${prefix}/${Constants.NamePathRacineProject}/${namePath}";

    // -- verifier si le chemin PathSaveData existe et cree si il n'existe pas
    if (!await Directory(PathSaveData).exists()) {
      await Directory(PathSaveData).create(recursive: true);
      print('Le dossier : $namePath :::  vient d etre cree ');
    } else {
      print('Le dossier ::  $namePath  :: existe déjà.');
    }

    return PathSaveData;

  }








  static Future<void> requestStoragePermission() async {

    // Vérifier si la permission est déjà accordée
    var status = await Permission.storage.status;

    //print('\n \n ----////---------- La permission de stockage est déjà accordée. ------////------- \n \n');

    if (status.isGranted) {

      // La permission est déjà accordée, vous pouvez effectuer des opérations de lecture/écriture ici
      //print('La permission de stockage est déjà accordée.');

      //var statusVerify = await Permission.storage.status;
      //print('\n \n Confirmation dans Page Chois Site La permission de stockage est déjà accordée  -->> $statusVerify. \n \n ');

    } else {

      // La permission n'est pas accordée, demandez-la à l'utilisateur
      var result = await Permission.storage.request();

      if (result.isGranted) {
        // L'utilisateur a accordé la permission
        //print('La permission de stockage a été accordée par l utilisateur.');
      } else {
        // L'utilisateur a refusé la permission
        //print('La permission de stockage a été refusée par l\'utilisateur.');
      }


    }
  }

  static Future<void> requestStoragePermissionExterne() async {

    // Vérifier si la permission est déjà accordée
    var status = await Permission.manageExternalStorage.status;

    if (status.isGranted) {
      // La permission est déjà accordée, vous pouvez effectuer des opérations de lecture/écriture ici
      //print('La permission de stockage  requestStoragePermissionExterne  est déjà accordée.');
      //var statusVerify = await Permission.manageExternalStorage.status;

    } else {

      // La permission n'est pas accordée, demandez-la à l'utilisateur
      var result = await Permission.manageExternalStorage.request();

      if (result.isGranted) {
        // L'utilisateur a accordé la permission
        // print('La permission de requestStoragePermissionExterne stockage a été accordée par l utilisateur.');
      } else {
        // L'utilisateur a refusé la permission
        //print('La permission requestStoragePermissionExterne de stockage a été refusée par l\'utilisateur.');
      }
    }
  }

  static Future<void> requestAllPermissionStorage() async {
    // Demander la permission de stockage interne
    await requestStoragePermission();
    // Demander la permission de stockage externe
    await requestStoragePermissionExterne();
    //print("Permission de stockage demander avec succès.;");
  }


  //---- methode to convert des string path to Xfile
 convertStringPathToXfile(List<String> listPath) async {
    List<XFile> listXfile = [];
    for (String path in listPath) {
      listXfile.add(XFile(path));
    }
    imageXfile = listXfile;
    //return listXfile;
  }

  resetPickImage() {
    imageXfile = [];
    fileImage = null;
    imagePickerInstance = ImagePicker();
    ListPathImages = [];
    listImagesSend = [];
  }
}