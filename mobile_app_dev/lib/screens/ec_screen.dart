import 'package:flutter/material.dart';
import 'package:mobile_app_dev/screens/admin/ec_card.dart';

class ECScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ecCard("Future Business Leaders of America", "Description", "https://i1.wp.com/www.fbla-pbl.org/media/2021/07/FBLA-square.jpg?resize=300%2C300&ssl=1"),
          ecCard("Robotics", "Description", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROtysz-knjwvvu9-eC4xJVixeO9pcaebGopA&usqp=CAU"),
        ]
      )
    );
  }
}
