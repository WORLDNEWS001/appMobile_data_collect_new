import 'package:flutter/material.dart';
import 'package:secondtest/services/feature_drawing/drawing_room/presentation/ViewCroquisDraft.dart';



class ControllerCroquis extends StatefulWidget {
  int? id_enquete;
  String? pathCroquis;
  ControllerCroquis({
    super.key,
    this.id_enquete,
    this.pathCroquis,
  });

  @override
  State<ControllerCroquis> createState() => _ControllerCroquisState();
}

class _ControllerCroquisState extends State<ControllerCroquis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Croquis'),
      ),
      body: Center(
        child: ViewCroquisDraft(id_enquete: widget.id_enquete,pathImage: widget.pathCroquis,),
      ),
    );
  }
}
