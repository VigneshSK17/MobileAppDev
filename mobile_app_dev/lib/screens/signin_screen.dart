import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:mobile_app_dev/widgets/auth_screens/login_text_field.dart';
import 'package:mobile_app_dev/widgets/auth_screens/rounded_button.dart';

class SignInScreen extends StatefulWidget {
  static String id = '/SignIn';

  State<SignInScreen> createState() => _SignInScreenState();
} 

class _SignInScreenState extends State<SignInScreen>{
  bool _isHidden = true;
  // TextEditingController textController = TextEditingController();

  GestureDetector updateTextFieldState() {
    return GestureDetector(
        onTap: () => setState(() => _isHidden = !_isHidden),
        child: Icon(_isHidden ? Icons.visibility_off : Icons.visibility)
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign in"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginTextField(isUsername: true, updateTextField: GestureDetector(child: Flex(direction: Axis.vertical, children: [Gap(0)]))),
              SizedBox(
                height: 30,
              ),
              LoginTextField(isUsername: false, updateTextField: updateTextFieldState(), isHidden: _isHidden),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                  text: 'Log In',
                  press: () => print('Pressed Log In'),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).backgroundColor
              ),
            ]
          ),
        ), 
      )
    );
  }
}
