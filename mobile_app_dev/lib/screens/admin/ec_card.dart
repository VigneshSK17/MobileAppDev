import 'package:flutter/material.dart';
import 'package:mobile_app_dev/bars.dart';

Widget ecCard(
  var title,
  var description,
  var image,
){
  return ExpansionTile(
    expandedAlignment: Alignment.topLeft,
    title: RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Image.network(
              image,
              height: 50,
              width: 50,
              ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ]
      ),
    ),
    children: [
      Text(
        description, 
        textAlign: TextAlign.left,
      ),
      IconButton(
        icon: Icon(
          Icons.email,
        ),
        onPressed: () {
          
        },
      ),
    ]
  );
}