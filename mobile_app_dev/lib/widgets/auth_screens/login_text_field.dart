import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class LoginTextField extends StatelessWidget {

  final bool isUsername;
  final bool isHidden;
  final GestureDetector updateTextField;

  const LoginTextField({
    required this.isUsername,
    required this.updateTextField,
    this.isHidden = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-30,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: isUsername ? 'Email' : 'Password',
            hintText: isUsername ? 'Enter your email' : 'Enter your password',
            suffix: updateTextField
        ),
        obscureText: isHidden,
        enableSuggestions: false,
        autocorrect: false,
      ),
    );
  }

}