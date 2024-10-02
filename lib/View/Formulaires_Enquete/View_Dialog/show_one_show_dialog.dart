

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:secondtest/View/Formulaires_Enquete/View_Dialog/detail_view_dialog/detail_view_dialog_objet.dart';


class OneShowDialog extends StatelessWidget {
  const OneShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: (){

                  //DialogCust(context);
                  //showAnimatedDialog(context: context, builder: builder)
                  showAnimatedDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return dialogWidCust(context);
                    },

                    duration: Duration(milliseconds: 500),
                    animationType: DialogTransitionType.slideFromBottom,
                    curve: Curves.fastOutSlowIn,
                  );
                },


              child: Text("TestShowDialog"))
        ],

      ),
    );
  }

  void DialogCust(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => CleanDialog(
        title: 'Error',
        content: Text(
          'We were not able to update your information.',
          textAlign: TextAlign.center,
          style:TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20
          ),
        ),
        backgroundColor:  Colors.blue,
        titleTextStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
        actions: [
          CleanDialogActionButtons(
            actionTitle: 'Cancel',
            onPressed: () => Navigator.pop(context),
          ),
          CleanDialogActionButtons(
            actionTitle: 'Try again',
            textColor: const Color(0XFF27ae61),
            onPressed: () {},
          ),
          CleanDialogActionButtons(
            actionTitle: 'Try again',
            textColor: Colors.red,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget dialogWidCust(BuildContext context){
    return CleanDialog(
      title: 'Error',
      content: Text(
                  'We were not able to update your information.',
                  textAlign: TextAlign.center,
                  style:TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20
                  ),
              ),

      backgroundColor:  Colors.blue,
      titleTextStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      actions: [
        CleanDialogActionButtons(
          actionTitle: 'Cancel',
          onPressed: () => Navigator.pop(context),
        ),
        CleanDialogActionButtons(
          actionTitle: 'Try again',
          textColor: const Color(0XFF27ae61),
          onPressed: () {},
        ),
        CleanDialogActionButtons(
          actionTitle: 'Try again',
          textColor: Colors.red,
          onPressed: () {
            Navigator.pop(context);
          },


        ),
      ],
    );
  }
}
