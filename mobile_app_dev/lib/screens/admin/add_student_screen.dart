import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_app_dev/firebase/auth_provider.dart';
import 'package:mobile_app_dev/widgets/auth_screens/login_text_field.dart';
import 'package:mobile_app_dev/widgets/auth_screens/rounded_button.dart';
import 'package:provider/provider.dart';

class CreateStudent extends StatefulWidget {
  @override
  _CreateStudentState createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {

  bool _isHidden = true;
   TextEditingController email = TextEditingController();
   TextEditingController password = TextEditingController();
   TextEditingController firstName = TextEditingController();
   TextEditingController lastName = TextEditingController();
   TextEditingController schoolName = TextEditingController();

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
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoginTextField(labelText: 'First Name', updateTextField: GestureDetector(child: Flex(direction: Axis.vertical, children: [Gap(0)])), controller: firstName),
                      SizedBox(
                        height: 10,
                      ),
                      LoginTextField(labelText: 'Last Name', updateTextField: GestureDetector(child: Flex(direction: Axis.vertical, children: [Gap(0)])), controller: lastName),
                      SizedBox(
                        height: 10,
                      ),
                      LoginTextField(labelText: 'Email', updateTextField: GestureDetector(child: Flex(direction: Axis.vertical, children: [Gap(0)])), controller: email),
                      SizedBox(
                        height: 10,
                      ),
                      LoginTextField(labelText: 'Password', updateTextField: updateTextFieldState(), isHidden: _isHidden, controller: password),
                      SizedBox(
                        height: 10,
                      ),
                      LoginTextField(labelText: 'School Name', updateTextField: GestureDetector(child: Flex(direction: Axis.vertical, children: [Gap(0)])), isHidden: _isHidden, controller: schoolName),
                      SizedBox(
                        height: 10,
                      ),
                      RoundedButton(
                        text: 'Add Student',
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).backgroundColor,
                        press: () async {
                          String emailStr = email.text.trim();
                          String passwordStr = password.text.trim();
                          String firstNameStr = firstName.text.trim();
                          String lastNameStr = lastName.text.trim();
                          String schoolnameStr = schoolName.text.trim();
                          String roleStr = 'student';

                          context.read<AuthenticationProvider>().signUp(
                              email: emailStr,
                              password: passwordStr,
                              firstName: firstNameStr,
                              lastName: lastNameStr,
                              schoolName: schoolnameStr,
                              role: roleStr
                          );
                        },
                      ),
                    ]
                ),
            ),
          )
        )
    );
  }
}