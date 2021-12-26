import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  User? currentUser;

  String uid = " ";
  String email = " ";
  String password = " ";
  String firstName = " ";
  String lastName = " ";
  String schoolName = " ";
  String role = " ";

  Future<void> getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser!;
  }

  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Text('Welcome ${currentUser?.displayName}!',
              style: TextStyle(fontSize: 35),
              textAlign: TextAlign.left),
        )
      )
    );
  }

}