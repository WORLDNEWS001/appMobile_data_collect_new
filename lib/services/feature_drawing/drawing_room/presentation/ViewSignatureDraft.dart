import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:secondtest/services/enquete/signature_close_enquete/MethodeManageSignature.dart';
import 'dart:ui' as ui;

import 'package:secondtest/services/feature_drawing/drawing_room/model/drawing_point.dart';
import 'package:secondtest/services/manage_image/pick_image_data.dart';


class ViewSignatureDraft extends StatefulWidget {
  int? id_enquete;

   ViewSignatureDraft({
    super.key,
    this.id_enquete,
  });

  @override
  State<ViewSignatureDraft> createState() => _ViewSignatureDraftState();
}

class _ViewSignatureDraftState extends State<ViewSignatureDraft> {
  var avaiableColor = [
    Colors.black,
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.brown,
  ];

  var historyDrawingPoints = <DrawingPoint>[];
  var drawingPoints = <DrawingPoint>[];

  var selectedColor = Colors.black;
  var selectedWidth = 2.0;

  DrawingPoint? currentDrawingPoint;

  GlobalKey _containerKey = GlobalKey();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //----- inscription qui permet de faire Roter le telephone en paysage
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //----- inscription qui permet de rendre la rotation du telephone en mode automatique

  }

  Future<bool> _onWillPop() async {
    // Remettre le mode de rotation automatique
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    return true;
  }



  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    double ratioScreen = size.width/size.height;
    //print("la largeur ecrant est de  ----> ${size.width}  <----");
    //print("la hauteur ecrant est de  ----> ${size.height}  <----");

    //------ le calul qu'il faut pour que le ratio soit toujour == a 100
    double ratio = 100/ratioScreen;

    //------ calcul de margin a 100 necessaire
    double marginCalc = ratio* ratioScreen;
    //print("Le margin calculer est de  ----> ${marginCalc}  <----");



    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(150),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[200],
                    border: Border.all(color: Color.fromRGBO(27, 175, 255, 1.0), width: 100,strokeAlign: BorderSide.strokeAlignOutside),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: RepaintBoundary(
                    key: _containerKey,
                    child: Center(

                        child : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onPanStart: (details) {
                              setState(() {
                                currentDrawingPoint = DrawingPoint(
                                  id: DateTime.now().microsecondsSinceEpoch,
                                  offsets: [
                                    details.localPosition,
                                  ],
                                  color: selectedColor,
                                  width: selectedWidth,
                                );

                                if (currentDrawingPoint == null) return;
                                drawingPoints.add(currentDrawingPoint!);
                                historyDrawingPoints = List.of(drawingPoints);
                              });
                            },
                            onPanUpdate: (details) {
                              setState(() {
                                if (currentDrawingPoint == null) return;

                                currentDrawingPoint = currentDrawingPoint?.copyWith(
                                  offsets: currentDrawingPoint!.offsets
                                    ..add(details.localPosition),
                                );
                                drawingPoints.last = currentDrawingPoint!;
                                historyDrawingPoints = List.of(drawingPoints);
                              });
                            },
                            onPanEnd: (_) {
                              currentDrawingPoint = null;
                            },
                            child: CustomPaint(
                              painter: DrawingPainter(
                                drawingPoints: drawingPoints,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              ),
                            ),
                          ),
                        )

                    ),
                  ),
                ),
              ),




              Center(
                child: IgnorePointer(
                  ignoring: true,
                  child: ClipRRect(
                    //borderRadius: BorderRadius.circular(50), // Internal border radius
                    child:Container(
                      width: MediaQuery.of(context).size.width/1,
                      height: MediaQuery.of(context).size.height/1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(27, 175, 255, 1.0),
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              ),



              SizedBox(height: 20),


              /// color pallet
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 16,
                right: 16,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 80,
                  child: Text("Votre Signature ici",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
              ),


              /*
          /// pencil size
          Positioned(
            top: MediaQuery.of(context).padding.top + 80,
            right: 0,
            bottom: 150,
            child: RotatedBox(
              quarterTurns: 3, // 270 degree
              child: Slider(
                value: selectedWidth,
                min: 1,
                max: 20,
                onChanged: (value) {
                  setState(() {
                    selectedWidth = value;
                  });
                },
              ),
            ),
          ),*/
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.blue,
                heroTag: "Undo",
                onPressed: () {
                  if (drawingPoints.isNotEmpty && historyDrawingPoints.isNotEmpty) {
                    setState(() {
                      drawingPoints.removeLast();
                    });
                  }
                },
                child: const Icon(Icons.undo),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                heroTag: "Redo",
                onPressed: () {
                  setState(() {
                    if (drawingPoints.length < historyDrawingPoints.length) {
                      // 6 length 7
                      final index = drawingPoints.length;
                      drawingPoints.add(historyDrawingPoints[index]);
                    }
                  });
                },
                child: const Icon(Icons.redo),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                heroTag: "Save",
                backgroundColor: Colors.orangeAccent,
                onPressed: () {
                  // Capture le widget de dessin et sauvegarder dans une image
                  captureImageFromWidget_Xfile(_containerKey);
                },
                child: const Icon(
                  Icons.save,
                  size: 35,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),);









  }


  Future<XFile?> captureImageFromWidget_Xfile(GlobalKey<State<StatefulWidget>> containerKey) async {
    try {
      print("\n\n\n --- Je viens de Capturer l image \n\n\n");
      RenderRepaintBoundary boundary = _containerKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0); // Adjust pixel ratio as needed
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      if (pngBytes != null) {

        //----- Generate Xfile image
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/captured_image.png';
        final file = File(filePath);
        await file.writeAsBytes(pngBytes);
        XFile? xFileImageDraw= XFile(filePath);
        //----------- Return the XFile

        PickImageData? pickImageData = PickImageData();
        String? PathImageDraw = await pickImageData.compressAndSavePathImage(imageFile: xFileImageDraw,isCompress: false,namePathSaveCustom: "drawing_croquis");

        print("\n\n\nle path de l'image dessiné est de  ----> ${PathImageDraw}  <----\n\n\n");

        saveAndSendDrawingSignature(pathDrawingSignature: PathImageDraw);

        return xFileImageDraw;
      } else {
        return null;
      }
    } catch (e) {
      print('Error capturing image: $e');
      return null;
    }
  }





  //----------------- OTHERS METHODES -----------------//

  saveAndSendDrawingSignature({required String pathDrawingSignature}) async {
    //----- Save and Send Drawing Signature
    //----- Send Drawing Signature
    //----- Save Drawing Signature


    if(widget.id_enquete == null){
      return;
    }else{

      await MethodeManageSignature().SendSignatureToCloseEnquete(context: context, PathImageDrawingSign: pathDrawingSignature, id_enquette: widget.id_enquete!).then((value) {

        Logger().w("\n\n\n\n\n\n\n\n Envoie de signature et cloture de l'enquette Terminer   :: \n\n ${value} \n\n");

      });


    }

  }














}









class DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoints;

  DrawingPainter({required this.drawingPoints});

  @override
  void paint(Canvas canvas, Size size) {
    for (var drawingPoint in drawingPoints) {
      final paint = Paint()
        ..color = drawingPoint.color
        ..isAntiAlias = true
        ..strokeWidth = drawingPoint.width
        ..strokeCap = StrokeCap.round;

      for (var i = 0; i < drawingPoint.offsets.length; i++) {
        var notLastOffset = i != drawingPoint.offsets.length - 1;

        if (notLastOffset) {
          final current = drawingPoint.offsets[i];
          final next = drawingPoint.offsets[i + 1];
          canvas.drawLine(current, next, paint);
        } else {
          /// we do nothing
        }
      }
    }
  }




  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }



}


