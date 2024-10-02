import 'package:flutter/material.dart';

class MyDialogLoader {
  static showLoadingDialog(BuildContext context, String text) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 25.0),
                Text(
                  text,
                  style: TextStyle(fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                  ),
                  textAlign: TextAlign.center,

                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static hideLoadingDialog(BuildContext context) {
    //Navigator.of(context, rootNavigator: true).pop(); // Ferme le dialog
    Navigator.of(context).pop(); // Ferme la page
  }
}
