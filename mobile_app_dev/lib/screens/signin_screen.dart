import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:mobile_app_dev/firebase/auth_provider.dart';
import 'package:mobile_app_dev/widgets/auth_screens/login_text_field.dart';
import 'package:mobile_app_dev/widgets/auth_screens/rounded_button.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static String id = '/SignIn';

  State<SignInScreen> createState() => _SignInScreenState();
} 

class _SignInScreenState extends State<SignInScreen>{
  bool _isHidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              LoginTextField(labelText: 'Email', updateTextField: GestureDetector(child: Flex(direction: Axis.vertical, children: [Gap(0)])), controller: emailController),
              SizedBox(
                height: 30,
              ),
              LoginTextField(labelText: 'Password', updateTextField: updateTextFieldState(), isHidden: _isHidden, controller: passwordController),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                  text: 'Log In',
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).backgroundColor,
                  press: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if(email.isEmpty){
                      print("Email is Empty");
                    } else if(password.isEmpty){
                        print("Password is Empty");
                    } else {
                      context.read<AuthenticationProvider>().signIn(
                        email: email,
                        password: password,
                      );
                    }
                  },
              ),
            ]
          ),
        ), 
      )
    );
  }
}
