











import 'package:flutter/material.dart';

class CustomBottomSheet {
   Function exitAction;
   Function confirmAction;
   String typeAction;
   Widget content;
   String? title;
   String? subTitle;
   double? heightFactor;

  CustomBottomSheet({
    required this.exitAction,
    required this.confirmAction,
    required this.typeAction,
    required this.content,
    this.title,
    this.subTitle,
    this.heightFactor,
  });

  ///-------- cette methode est une Show Dialog en forme de BottomSheet qui prend en parametre les type de dialog
   ///----- Dialog type : danger, attention, primary, success
  void show(BuildContext context) {
    Color backgroundColor;
    String assetImage;
    List<Widget> actions;

    switch (typeAction) {
      case 'danger':
        backgroundColor = Colors.red.shade50;
        assetImage = 'assets/icon_doser/action_dialog/warning.png';
        actions = [
          ElevatedButton(
            onPressed: () {
              exitAction();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Text('Annuler',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              confirmAction();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green, // background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Text('Confirmer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ];
        break;
      case 'attention':
        backgroundColor = Colors.yellow.shade50;
        assetImage = 'assets/icon_doser/action_dialog/avertissement.png';
        actions = [
          ElevatedButton(
            onPressed: () {
              exitAction();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Text('Annuler',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              confirmAction();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green, // background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Text('Confirmer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ];
        break;
      case 'primary':
        backgroundColor = Colors.blue.shade50;
        assetImage = 'assets/icon_doser/action_dialog/info.png';
        actions = [
          ElevatedButton(
            onPressed: () {
              exitAction();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Text('Annuler',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              confirmAction();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Text('Confirmer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ];
        break;
      case 'success':
        backgroundColor = Colors.green.shade50;
        assetImage = 'assets/icon_doser/action_dialog/success.png';
        actions = [
          ElevatedButton(
            onPressed: () {
              confirmAction();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green, // background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Text('OK',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ];
        break;
      default:
        backgroundColor = Colors.white;
        assetImage = '';
        actions = [];
    }

    showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          //heightFactor: heightFactor ?? 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  assetImage,
                  height: 80,
                ),
                SizedBox(height: 10),

                (title != null || title != '')
                    ? Text(
                        title ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 2),
                (subTitle != null || subTitle != '')
                    ? Text(
                        subTitle ?? '',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    : SizedBox(),

                SizedBox(height: 8),
                //Expanded(child: content),
                content,
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}










/*

import 'package:flutter/material.dart';

class CustomBottomSheet {
  final Function exitAction;
  final Function confirmAction;
  final String typeAction;
  final Widget content;

  CustomBottomSheet({
    required this.exitAction,
    required this.confirmAction,
    required this.typeAction,
    required this.content,
  });

  void show(BuildContext context) {
    Color backgroundColor;
    String assetImage;
    List<Widget> actions;

    switch (typeAction) {
      case 'danger':
        backgroundColor = Colors.red.shade50;
        assetImage = 'assets/icon_doser/action_dialog/warning.png';
        actions = [
          TextButton(
            onPressed: () {
              exitAction();
              Navigator.of(context).pop();
            },
            child: Text('Annuler', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              confirmAction();
              Navigator.of(context).pop();
            },
            child: Text('Confirmer', style: TextStyle(color: Colors.red)),
          ),
        ];
        break;
      case 'attention':
        backgroundColor = Colors.yellow.shade50;
        assetImage = 'assets/icon_doser/action_dialog/avertissement.png';
        actions = [
          TextButton(
            onPressed: () {
              exitAction();
              Navigator.of(context).pop();
            },
            child: Text('Annuler', style: TextStyle(color: Colors.yellow[800])),
          ),
          TextButton(
            onPressed: () {
              confirmAction();
              Navigator.of(context).pop();
            },
            child: Text('Confirmer', style: TextStyle(color: Colors.yellow[800])),
          ),
        ];
        break;
      case 'primary':
        backgroundColor = Colors.blue.shade50;
        assetImage = 'assets/icon_doser/action_dialog/info.png';
        actions = [
          TextButton(
            onPressed: () {
              exitAction();
              Navigator.of(context).pop();
            },
            child: Text('Annuler', style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () {
              confirmAction();
              Navigator.of(context).pop();
            },
            child: Text('Confirmer', style: TextStyle(color: Colors.blue)),
          ),
        ];
        break;
      case 'success':
        backgroundColor = Colors.green.shade50;
        assetImage = 'assets/icon_doser/action_dialog/success.png';
        actions = [
          TextButton(
            onPressed: () {
              confirmAction();
              Navigator.of(context).pop();
            },
            child: Text('OK', style: TextStyle(color: Colors.green)),
          ),
        ];
        break;
      default:
        backgroundColor = Colors.white;
        assetImage = '';
        actions = [];
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    assetImage,
                    height: 80,
                  ),
                  SizedBox(height: 16),
                  content,
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions,
                  ),
                ],
              ),
            )
          );
      },
    );
  }
}




*/

















/*


import 'package:flutter/material.dart';

class CustomBottomSheet {
  final Function exitAction;
  final Function confirmAction;
  final String typeAction;
  final Widget content;

  CustomBottomSheet({
    required this.exitAction,
    required this.confirmAction,
    required this.typeAction,
    required this.content,
  });

  void show(BuildContext context) {
    Color backgroundColor;
    String assetImage;
    List<Widget> actions;

    switch (typeAction) {
      case 'danger':
        backgroundColor = Colors.red.shade50;
        assetImage = 'assets/icon_doser/action_dialog/warning.png';
        actions = [
          TextButton(
            onPressed: () => exitAction(),
            child: Text('Annuler', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () => confirmAction(),
            child: Text('Confirmer', style: TextStyle(color: Colors.red)),
          ),
        ];
        break;
      case 'attention':
        backgroundColor = Colors.yellow.shade50;
        assetImage = 'assets/icon_doser/action_dialog/avertissement.png';
        actions = [
          TextButton(
            onPressed: () => exitAction(),
            child: Text('Annuler', style: TextStyle(color: Colors.yellow[800])),
          ),
          TextButton(
            onPressed: () => confirmAction(),
            child: Text('Confirmer', style: TextStyle(color: Colors.yellow[800])),
          ),
        ];
        break;
      case 'primary':
        backgroundColor = Colors.blue.shade50;
        assetImage = 'assets/icon_doser/action_dialog/info.png';
        actions = [
          TextButton(
            onPressed: () => exitAction(),
            child: Text('Annuler', style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () => confirmAction(),
            child: Text('Confirmer', style: TextStyle(color: Colors.blue)),
          ),
        ];
        break;
      case 'success':
        backgroundColor = Colors.green.shade50;
        assetImage = 'assets/icon_doser/action_dialog/success.png';
        actions = [
          TextButton(
            onPressed: () => confirmAction(),
            child: Text('OK', style: TextStyle(color: Colors.green)),
          ),
        ];
        break;
      default:
        backgroundColor = Colors.white;
        assetImage = '';
        actions = [];
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                assetImage,
                height: 40,
              ),
              SizedBox(height: 16),
              content,
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions,
              ),
            ],
          ),
        );
      },
    );
  }
}

*/