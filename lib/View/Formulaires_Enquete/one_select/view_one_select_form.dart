import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:secondtest/model/class_abstraite/abstrat_data_select_data_oms.dart';

 class ViewOneSelectForm <T extends AbstratDataSelectDataOms> extends StatelessWidget{

   List<T?>? liste_de_type;
   T? default_one_data_liste;
   String labelText;
   bool Disable;
   IconData? iconData;
   String? path_asset_image_icon;
   Function(T?) function_onChanged;

   ViewOneSelectForm({
     required this.liste_de_type,
     required this.default_one_data_liste,
     required this.labelText,
     this.iconData =null,
     this.path_asset_image_icon = null,
     required this.function_onChanged,
     this.Disable = false
   });

   @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     //print("le Type de iconData.runtimeType == ${iconData.runtimeType}");
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: DropdownButtonFormField<T>(
        items: liste_de_type?.map((item) {

          //print("print with context---- ${MediaQuery.of(context).size.width}");

          double fontSizeCust = 14;
          double width = MediaQuery.of(context).size.width;
          if(width <=500){
            fontSizeCust = 10;
          }

          return DropdownMenuItem<T>(
            value: item,
            //child: Text(item?.value ?? ""),
            child: Container(
              //color: Colors.red,
              //width: MediaQuery.of(context).size.width*0.8,
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.6), // Définir une largeur maximale pour le texte
              child: Text(
                item?.value ?? "",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSizeCust,
                  color: Colors.blueAccent,
                ),
                maxLines: 1, // Limiter le texte à une seule ligne
              ),
            ),


            // Text(
            //         "${item?.value}",
            //         overflow: TextOverflow.ellipsis,
            //         style: TextStyle(
            //           fontSize: 14,
            //           color: Colors.red,
            //         ),
            //        // maxLines: 5,
            // ),
          );
        }).toList(),

        value: default_one_data_liste,
        decoration: InputDecoration(
          // prefixStyle: TextStyle(
          //   fontSize: 30,
          // ),

          contentPadding: EdgeInsets.all(15),
          prefixIcon: (iconData == null) ? IconImage(path_asset_image_icon: path_asset_image_icon ?? ""): IconBuildCustom(iconData: iconData) ,
          label: Text(labelText),
          labelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),

         /* focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue), // Couleur de la bordure après la sélection
            borderRadius: BorderRadius.circular(10),
          ), */


          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue), // Couleur de la bordure après la sélection
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        borderRadius: BorderRadius.circular(10),
        onChanged: Disable ? null :
            (selectValue) {
          function_onChanged(selectValue);
        },
      ),
    );

  }

   Container? IconImage({required String path_asset_image_icon }) {
     if (path_asset_image_icon != "" || path_asset_image_icon.isNotEmpty) {
         return Container(
           padding: EdgeInsets.all(8),
           child: Image.asset(
             path_asset_image_icon,
             width: 10.0,
             height: 10.0,
             fit: BoxFit.cover,
           ),
         );



      }
   }

   Icon? IconBuildCustom({required IconData? iconData}){
     return Icon(iconData);
   }
/*
   Widget buildWidgetSelectDropdown<T extends AbstratDataSelectDataOms>(
       List<T> roadTypeList,
       T? selectedRoadType,
       String labelText,
       IconData iconData,
       Function(T?) onChanged,
       ) {
     return Container(
       margin: EdgeInsets.only(bottom: 10, top: 10),
       child: DropdownButtonFormField<T>(
         items: roadTypeList.map((item) {
           return DropdownMenuItem<T>(
             value: item,
             child: Text(item.value ?? ""),
           );
         }).toList(),
         value: selectedRoadType,
         decoration: InputDecoration(
           prefixIcon: Icon(iconData),
           label: Text(labelText),
           labelStyle: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold,
           ),
           border: OutlineInputBorder(),
         ),
         borderRadius: BorderRadius.circular(10),
         onChanged: (selectValue) {
           onChanged(selectValue);
         },
       ),
     );
   }
*/
}