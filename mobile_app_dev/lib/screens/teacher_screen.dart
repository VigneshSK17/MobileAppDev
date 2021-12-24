import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:mobile_app_dev/widgets/teacher_card2.dart';
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
  List<Widget> exampleCards = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      exampleCards.add(
        teacherCard2(testImage, 'Mrs.', 'Joe', 'Johnson', 'English', 1000,
            'hi@gmail.com', 'joejohnson.weebly.com', context),
      );
    }

    // TODO: Add search bar to search through the teachers Maybe add filters if time. Maybe use material_floating_search_bar package
    return SafeArea(
        child: Container(
            child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: FloatingSearchBar(
                      // onSubmitted:(query) {
                      //   if(query == exampleCards[0].teacherFirstName){
                      //
                      //   }
                      // },
                      builder: (context, transition) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Material(
                            color: Colors.white,
                            elevation: 4.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: Colors.accents.map((color) {
                                return Container(height: 112, color: color);
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                Container(child: SingleChildScrollView(child: Column(children: exampleCards)))
        ])
        )
        )
    );

  }
}
