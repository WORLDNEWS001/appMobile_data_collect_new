import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';

import 'package:secondtest/VariableData.dart';
import 'package:secondtest/global_method.dart';

class ImagePreviewDialog extends StatelessWidget {
  final String imagePath;

  const ImagePreviewDialog({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.white,

      insetPadding: EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.95,
        //color: Colors.white,

        child: Column(
          children: [
            Text("CROQUIS DE L'ENQUETE",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width *0.9 ,

                child:  PhotoViewGallery.builder(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  itemCount: 1,
                  builder: (context, index) {
                    return PhotoViewGalleryPageOptions(

                      imageProvider: _getImageProvider(imagePath),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 4,
                      // Remove the backgroundDecoration parameter if it's not supported
                    );
                  },
                  scrollPhysics: BouncingScrollPhysics(),
                  // Remove the backgroundDecoration parameter if it's not supported
                ),

              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close"),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _getImageProvider(String path) {
    print("\n\n\n\n path du croquis a Afficher: $path \n\n\n\n ");
    if (path.startsWith('http') || GlobalMethod.isURL(path)) {
      if(isConnected==true ){
        return CachedNetworkImageProvider(path);
      }else{
        //-- retunr image asset
        return AssetImage('assets/icon_doser/no_internet.png');
      }

    } else {
      return FileImage(File(path));
    }
  }

  static Future<void> show(BuildContext context, String imagePath) {
    return showDialog(
      context: context,
      builder: (context) => ImagePreviewDialog(imagePath: imagePath),
    );
  }
}
