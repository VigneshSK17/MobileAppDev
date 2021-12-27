import 'dart:ui';
import 'package:flutter/material.dart';


class AlertWidget extends StatelessWidget {

  String title;
  String content;
  VoidCallback continueCallBack;
  BuildContext context;

  AlertWidget(this.title, this.content, this.continueCallBack, this.context);

  @override
  Widget build(BuildContext context) {
    // TextStyle? textStyle = Theme.of(context).textTheme.bodyText1);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child:  AlertDialog(
      // title: new Text(title,style: textStyle,),
      // content: new Text(content, style: textStyle,),
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: const Text("Continue"),
           onPressed: () {
            continueCallBack();
          },
        ),
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      ));
  }
}