import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app_dev/widgets/home_calendar.dart';
import 'package:mobile_app_dev/widgets/home_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double opacity = 0.0;

  // Fading in
  @override
  void initState() {
    super.initState();
    changeOpacity0();
  }

  changeOpacity0() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1.0;
        changeOpacity0();
      });
    });
  }

  getDate(var num) {
    DateTime now = DateTime.now();
    switch (num) {
      case 0:
        return DateFormat('EEEE, MMM dd').format(now);
    }
  }

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    // TODO: Use flutter_calendar_carousel package to create general calendar (w/ school events n holidays).
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(
                  top: deviceHeight(context) * 0.02,
                  left: deviceWidth(context) * 0.09,
                  right: deviceWidth(context) * 0.09,
                  bottom: deviceHeight(context) * 0.06,
                ),
                child: AnimatedOpacity(
                    opacity: opacity,
                    duration: Duration(seconds: 1),
                    child: Column(
                      children: <Widget>[
                        // TODO: NOTE: Use align when wanting to change alignment for text.
                        Align(
                          alignment: Alignment.center,
                          child: Text('Welcome!',
                              style: TextStyle(fontSize: 35),
                              textAlign: TextAlign.left),
                        ),
                        SizedBox(height: 8),
                        Text(getDate(0),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w100),
                            textAlign: TextAlign.left),
                        SizedBox(height: 16),
                        homeSlider(context),
                        Expanded(child: homeCalendar(context)),
                      ],
                    )))));
  }
}
