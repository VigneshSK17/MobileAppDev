import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

Widget homeSlider(BuildContext context) {
  return GFCarousel(
    height: 100,
    passiveIndicator: Theme.of(context).dividerColor,
    activeIndicator: Theme.of(context).secondaryHeaderColor,
    autoPlay: true,
    pagination: true,
    items: [
      ["Due Today", "Trash"],
      ["Lunch Today", "Trash"],
      ["Events Today", "Trash"],
    ].map(homeCardBuilder).toList(),
  );
}

Builder homeCardBuilder(var i) {
  return Builder(builder: (BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: FractionallySizedBox(
            heightFactor: 0.5,
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(children: [
                  Text(
                    i[0],
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Text(i[1], style: TextStyle(fontSize: 16.0))
                ]))));
  });
}
