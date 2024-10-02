import 'package:flutter/material.dart';

/// A Clean and minimalist Flutter Dialog
/***
 * CleanDialog(
    title: 'Error',
    content: 'We were not able to update your information.',
    backgroundColor: const Color(0XFFbe3a2c),
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
    ],
    ),
 */
///
class CleanDialog extends StatelessWidget {
  const CleanDialog({
    super.key,
    required this.backgroundColor,
    required this.actions,
    required this.title,
    required this.content,
    this.titleTextStyle,
    this.contentTextStyle,
    this.titleTextAlign,
    this.contentTextAlign,
  });

  /// Color to be displayed in the background of the Dialog
  final Color backgroundColor;

  /// The String to be displayed as title for the Dialog
  final String title;

  /// The dialog's text content
  final Widget content;

  /// The list of Buttons that will be displayed in the Dialog
  final List<CleanDialogActionButtons> actions;

  /// The title text alignement default value is TextAlign.Center
  final TextAlign? titleTextAlign;

  /// The content text alignement default value is TextAlign.Center
  final TextAlign? contentTextAlign;

  /// The content text style default value is TextStyle(fontWeight: FontWeight.bold, fontSize: 23)
  final TextStyle? titleTextStyle;

  /// The content text style default value is TextStyle(fontSize: 16)
  final TextStyle? contentTextStyle;

  /// Used to transfer backgroundColor to buttons textColor.
  List<CleanDialogActionButtons> _buildStyledActionButtons() => actions
      .map((e) => e.copyWith(textColor: e.textColor ?? backgroundColor))
      .toList();

  @override
  Widget build(BuildContext context) {
    final List<CleanDialogActionButtons> actions = _buildStyledActionButtons();

    Size size = MediaQuery.of(context).size;

    return Center(
      child: Dialog(
          insetPadding: EdgeInsets.all(20),
          insetAnimationCurve: Curves.easeInBack,
          insetAnimationDuration: Duration(seconds: 3),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            width: MediaQuery.of(context).size.width /1.3,
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40) ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.error,
                            color: backgroundColor,
                            size: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            textAlign: titleTextAlign ?? TextAlign.center,
                            style: titleTextStyle ??
                                const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),


                        SizedBox(
                          height: size.height / 50,
                        ),


                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, bottom: 40, top: 30) ,
                          child: content,
                        ),

                      ],
                    ),
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    actions.length,
                        (index) => Container(
                      height: 50,
                      width: 100,
                      //color: Colors.blueAccent[100],
                      child: actions.elementAt(index),
                    ),
                  ),
                ),

              ],
            ),



          )

      ),

    );
  }
}

class CleanDialogActionButtons extends StatelessWidget {
  const CleanDialogActionButtons(
      {super.key,
        required this.actionTitle,
        required this.onPressed,
        this.textColor});

  /// The String text that will be displayed for the action.
  final String actionTitle;

  /// The action that will be executed once the button tapped.
  final VoidCallback onPressed;

  /// Optional Color that will override the default parent `backgoundColor`.
  final Color? textColor;

  CleanDialogActionButtons copyWith({
    String? actionTitle,
    VoidCallback? onPressed,
    Color? textColor,
  }) =>
      CleanDialogActionButtons(
        actionTitle: actionTitle ?? this.actionTitle,
        onPressed: onPressed ?? this.onPressed,
        textColor: textColor ?? this.textColor,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: textColor?.withOpacity(.1),
      highlightColor: textColor?.withOpacity(.2),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          actionTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor ?? Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}