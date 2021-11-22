import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  var teacherCount = 5;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        2,
        Text('Teacher Directory'),
        Column(
          children: <Widget>[
            Expanded(child: Text('Search Bar')),
            Expanded(
              flex: 10,
              child: Swiper(
                  itemCount: teacherCount,
                  loop: false,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill),
                        ),
                        Expanded(
                          child: Text('Teacher #$index')
                        )
                      ],
                    );
                  }),
            )
          ],
        ));
  }
}
