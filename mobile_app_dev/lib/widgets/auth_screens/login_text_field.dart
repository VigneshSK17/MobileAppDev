import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class LoginTextField extends StatelessWidget {

  final String labelText;
  String hintText;
  final bool isHidden;
  final GestureDetector updateTextField;
  final TextEditingController controller;

  LoginTextField({
    required this.labelText,
    this.hintText = '',
    required this.updateTextField,
    required this.controller,
    this.isHidden = false,
  });


  @override
  Widget build(BuildContext context) {
    hintText = labelText.toLowerCase();
    return Container(
      width: MediaQuery.of(context).size.width-30,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: labelText,
            hintText: 'Enter your ' + hintText,
            suffix: updateTextField
        ),
        obscureText: isHidden,
        enableSuggestions: false,
        autocorrect: false,
      ),
    );
  }

}