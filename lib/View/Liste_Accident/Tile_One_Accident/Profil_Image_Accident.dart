
import 'package:flutter/material.dart';

class ProfilImageAccident extends StatelessWidget {

  String url_image;
  BuildContext? context_image;



  ProfilImageAccident({
    Key? key,
    this.url_image = "",
    this.context_image,
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {


    return Stack(
      alignment: Alignment.center,
      children: [
         Container(
            width: MediaQuery.of(context).size.width / 8,
            height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: DefaultImageManage(url_image: ""),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 8,
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: DefaultImageManage(url_image: url_image),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),

      ],
    );

  }


  ImageProvider<Object> DefaultImageManage({required String url_image }){
    if (url_image == "" || url_image.isEmpty){
      String asset_image ="assets/images/img_app_view_default/imgCrash.jpg";
      return AssetImage(asset_image);
    }else
      return NetworkImage(url_image,);
  }





}
