import 'package:flutter/material.dart';

enum TypeOption {
  consulter,
  modifier,
  ajouter_croquis,
  creation_pv,
  teminer_pv,
  generer_pv,
  generer_rapport,
  desactivate,
  activate,
  depositions;


  Icon getIconOption(){
    switch (this){
      case TypeOption.consulter: return const Icon(Icons.remove_red_eye, color: Colors.blueAccent,);
      case TypeOption.modifier: return const Icon(Icons.edit, color: Colors.blueAccent,);
      case TypeOption.ajouter_croquis : return const Icon(Icons.draw_outlined, color: Colors.blueAccent,);
      case TypeOption.teminer_pv : return const Icon(Icons.folder_copy_rounded, color: Colors.blueAccent,);
      case TypeOption.creation_pv : return const Icon(Icons.lock_outline, color: Colors.blueAccent,);
      case TypeOption.generer_pv : return const Icon(Icons.print, color: Colors.blueAccent,);
      case TypeOption.generer_rapport : return const Icon(Icons.print, color: Colors.blueAccent,);

      case TypeOption.desactivate : return const Icon(Icons.delete_forever_sharp, color: Colors.redAccent,);
      case TypeOption.activate : return const Icon(Icons.star, color: Colors.blueAccent,);
      case TypeOption.depositions : return const Icon(Icons.archive_sharp, color: Colors.blueAccent,);

    }
  }

}