import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:secondtest/GlobalConstantData.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:secondtest/VariableData.dart';
import 'package:secondtest/global_method.dart';
import 'package:secondtest/model/class_data_oms_type/Enquete/Drawing.dart';
import 'package:secondtest/screen/accidentScreens/listAccident.dart';
import 'package:secondtest/services/enquete/drawing_croquis_manager/MethodeManageDrawingCroquis.dart';
import 'dart:ui' as ui;

import 'package:secondtest/services/feature_drawing/drawing_room/model/drawing_point.dart';
import 'package:secondtest/services/manage_image/pick_image_data.dart';


class ViewCroquisDraft extends StatefulWidget {


    int? id_enquete;
    String? pathImage;


   ViewCroquisDraft({
    super.key,
    this.id_enquete,
    this.pathImage,
  });

  @override
  State<ViewCroquisDraft> createState() => _ViewCroquisDraftState();
}

class _ViewCroquisDraftState extends State<ViewCroquisDraft> {
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

  PickImageData? pickImageData = PickImageData();

  GlobalKey _containerKey = GlobalKey();

  bool activeImageBack = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
        onWillPop: _onWillPop2,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(35),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  border: Border.all(color: Colors.black, width: 100,strokeAlign: BorderSide.strokeAlignOutside),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RepaintBoundary(
                  key: _containerKey,
                  child: Center(

                      child : Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(238, 238, 238, 1.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child : GestureDetector(
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
                        color: Colors.black,
                        width: 35,
                      ),
                    ),
                  ),
                ),
              ),
            ),


            ((widget.pathImage != null) && activeImageBack) ?
            Center(
              child: IgnorePointer(
                ignoring: true,
                child: ClipRRect(
                  //borderRadius: BorderRadius.circular(50), // Internal border radius
                  child: Opacity(
                    opacity: 0.3,
                    child:  Container(
                      width: MediaQuery.of(context).size.width/1,
                      height: MediaQuery.of(context).size.height/1,
                      child: GlobalMethod.getImageInContainer(widget.pathImage),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
                :
            SizedBox(),





            SizedBox(height: 20),

            /// color pallet
            Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 16,
              right: 16,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: avaiableColor.length,
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: 8);
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = avaiableColor[index];
                        });
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: avaiableColor[index],
                          shape: BoxShape.circle,
                        ),
                        foregroundDecoration: BoxDecoration(
                          border: selectedColor == avaiableColor[index]
                              ? Border.all(color: Colors.blue, width: 4)
                              : Border.all(color: Colors.white, width: 4),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

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
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            FloatingActionButton(
              heroTag: "captureImageHelpDraw",
              onPressed: () async {
                String? PathImage = await pickImageData?.pickOneImageCamera(context: context);
                setState(() {
                  widget.pathImage = PathImage;
                  if (activeImageBack==false) {
                    activeImageBack = true;
                  }
                });
              },
              child:Icon(Icons.camera_alt_outlined) ,
            ),
            const SizedBox(width: 16),

            ...widget.pathImage != null ?
            [FloatingActionButton(
              heroTag: "see_back_image",
              onPressed: () {
                setState(() {
                  activeImageBack = !activeImageBack;
                });
              },
              child:activeImageBack
                  ? Image.asset("assets/icon_doser/eye_close.png",width: 30,)
                  : Image.asset("assets/icon_doser/eye_open.png",width: 30,),

            ),
            const SizedBox(width: 16),
          ]
                :
            [SizedBox()],

            FloatingActionButton(
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
              heroTag: "Effacer",
              onPressed: () {
                setState(() {
                  selectedColor = Color.fromRGBO(238, 238, 238, 1.0);
                  selectedWidth = 12.0;
                });
              },
              child: Image.asset("assets/icon_doser/erase.png",width: 30,),
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
      ),
    );








  }


  Future<bool> _onWillPop2() async {
    // Remettre le mode de rotation automatique
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    return true;
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

        await saveAndSendDrawing(pathDrawing: PathImageDraw);
        //---- attendre 1 seconde pour que l'image soit bien sauvegarder
        await Future.delayed(Duration(milliseconds: 1));

        print("Sauvegarde Executer avec success");


        return xFileImageDraw;
      } else {
        return null;
      }
    } catch (e) {
      print('Error capturing image: $e');
      return null;
    }
  }









  //---------------------- OTHERS METHODS ----------------------//

  saveAndSendDrawing({required String pathDrawing}) async {

    DrawingResp? drawingRespApi = DrawingResp(name: "local", path: pathDrawing);

    //----- test fonction add croquis drawing-----
    //----- widget.id_enquete=317;

    if(widget.id_enquete == null){
      return;
    }else{

    await MethodeManageDrawingCroquis().AddDrawingCroquis(context: context, drawing: drawingRespApi, id_enquette: widget.id_enquete!).then((value) {

      Logger().w("\n\n\n\n\n\n\n\n Envoie de croquis Terminer   :: \n\n ${value} \n\n");

    });


    }
  }

  //---------------------- END OTHERS METHODS ----------------------//

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


