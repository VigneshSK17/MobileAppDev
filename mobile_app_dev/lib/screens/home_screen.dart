import 'package:flutter/material.dart';

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
    // changeOpacity1();
    // changeOpacity2();
  }

  changeOpacity0() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1.0;
        changeOpacity0();
      });
    });
  }

  changeOpacity1() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity1();
      });
    });
  }

  changeOpacity2() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity2();
      });
    });
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
                        Text('Welcome',
                            style: TextStyle(fontSize: 35),
                            textAlign: TextAlign.left),
                        SizedBox(height: 8),
                        Text('12/11/2021',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w100),
                            textAlign: TextAlign.left)
                      ],
                    )))));
  }
}
