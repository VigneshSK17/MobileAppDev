import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widgets/teacher_card.dart';

class TeacherScreen extends StatefulWidget {
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen>
    with SingleTickerProviderStateMixin {
  var testImage = const NetworkImage(
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png');
  var _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
  }

  var orientation;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(children: [
      // TODO: Add search bar to search through the teachers Maybe add filters if time. Maybe use material_floating_search_bar package
      teacherCard(testImage, 'Mrs. Joe Johnson', 'English', 1000,
          'hi@gmail.com', 'joejohnson.weebly.com', _controller, context),
      teacherCard(testImage, 'Mrs. Joe Johnson', 'English', 1000,
          'hi@gmail.com', 'joejohnson.weebly.com', _controller, context),
      teacherCard(testImage, 'Mrs. Joe Johnson', 'English', 1000,
          'hi@gmail.com', 'joejohnson.weebly.com', _controller, context),
      teacherCard(testImage, 'Mrs. Joe Johnson', 'English', 1000,
          'hi@gmail.com', 'joejohnson.weebly.com', _controller, context),
      teacherCard(testImage, 'Mrs. Joe Johnson', 'English', 1000,
          'hi@gmail.com', 'joejohnson.weebly.com', _controller, context),
      teacherCard(testImage, 'Mrs. Joe Johnson', 'English', 1000,
          'hi@gmail.com', 'joejohnson.weebly.com', _controller, context),
    ])));
  }
}
