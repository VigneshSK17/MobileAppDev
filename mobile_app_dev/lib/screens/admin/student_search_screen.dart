
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_app_dev/helperFunctions/alert_widget.dart';
import 'package:mobile_app_dev/widgets/auth_screens/login_text_field.dart';
import 'package:mobile_app_dev/widgets/auth_screens/rounded_button.dart';

class StudentSearchScreen extends StatefulWidget {
  @override
  _StudentSearchScreenState createState() => _StudentSearchScreenState();
}

class _StudentSearchScreenState extends State<StudentSearchScreen> {

   TextEditingController emailController = TextEditingController();

   String email = " ";
   String password = " ";
   String firstName = " ";
   String lastName = " ";
   String uid = " ";

  bool _isHidden = true;

  void deleteUser() async {
    FirebaseFirestore.instance.collection('users').doc(uid).delete()
      .then((value) => {
        Navigator.pop(context),
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Student Deleted'),
          duration: Duration(seconds: 1),
        ))
      }).catchError((error) => {
        Navigator.pop(context),
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to delete student.'),
          duration: Duration(seconds: 1),
        )),
        print('Failed to delete student: $error')
      });
    
      try {
        await FirebaseAuth.instance.currentUser!.delete();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login') {
          print('The user must reauthenticate before this operation can be executed.');
        }
      }
  }
  

  // TODO: Let users change their password, somewhat like this (https://github.com/Bytx-youtube/adminapp/blob/main/lib/screens/edituserdata.dart)
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
                  LoginTextField(labelText: 'Email', updateTextField: GestureDetector(child: Flex(direction: Axis.vertical, children: [Gap(0)])), controller: emailController),
                  SizedBox(
                    height: 10,
                  ),
                  RoundedButton(
                    text: 'Search',
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).backgroundColor,
                    press: () async {
                      String userEmail = emailController.text.trim();
                      
                      final QuerySnapshot snap = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: userEmail).get();
                      if(snap.size == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('No student can be found with this email. Please try again'),
                          duration: Duration(seconds: 1),
                        ));
                        emailController.clear();
                      } else {
                        setState(() {
                            email = userEmail;
                            password = snap.docs[0]['password'];
                            firstName = snap.docs[0]['firstName'];
                            lastName = snap.docs[0]['lastName'];
                            uid = snap.docs[0]['uid'];

                            _isHidden = false;
                        });
                      }
                    }
                  ),
                  !_isHidden ? Card (
                    elevation: 2, 
                    child: Column(children: [
                      ListTile(
                        title: Text(firstName + " " + lastName),
                        subtitle: Text("Password: " + password),
                      ),
                      ButtonBar(alignment: MainAxisAlignment.start, children: [
                        IconButton(
                          icon: Icon(Icons.delete_forever),
                          onPressed: () {
                            showDialog(context: context, 
                              builder: (context) => AlertWidget('Deleting $firstName $lastName', 'Are you sure you want to delete this student?',
                                () => deleteUser(),
                                context
                            ));
                            _isHidden = true;
                            emailController.clear();
                          },
                        ),
                        // TODO: Add functionality for editing student info
                        // IconButton(
                        //     icon: Icon(Icons.link),
                        //     onPressed: () {
                        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //         content: Text(teacherWebsite),
                        //         duration: Duration(seconds: 1),
                        //       ));
                        //     })
                      ])
                    ])
                  ) : Container()
                ],
              ) 
            )
          )
        
        )
    );
  }

}