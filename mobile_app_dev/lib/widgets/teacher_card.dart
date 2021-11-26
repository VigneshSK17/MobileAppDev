import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget teacherCard(
    var teacherImage,
    var teacherName,
    var teacherDept,
    int roomNum,
    var teacherEmail,
    var teacherWebsite,
    var _controller,
    BuildContext context) {
  return GestureDetector(
      // TODO: Make card expand and take up full screen when tapped
      // onTap: () {
      //   ScaleTransition(
      //     scale: CurvedAnimation(
      //         parent: AnimationController(
      //             duration: Duration(milliseconds: 500), vsync: _controller),
      //         curve: Curves.bounceOut),
      //     alignment: Alignment.center,
      //     child: Icon(Icons.image, size: 50.0),
      //   );
      // },
      child: Container(
          height: 130,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(16.0),
              topRight: const Radius.circular(16.0),
            ),
            color: Theme.of(context).backgroundColor,
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(image: teacherImage, fit: BoxFit.fill),
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Gap(10),
                    Row(children: [
                      const Gap(20),
                      Flexible(
                        child: Text(teacherName,
                            strutStyle: StrutStyle(leading: 0),
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15)),
                      ),
                      Flexible(
                          child: Text(
                        ' | ' + teacherDept,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ]),
                    const Gap(5),
                    Row(children: [
                      const Gap(20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Flexible(
                              child: Text(
                            'Room #' + roomNum.toString(),
                            textAlign: TextAlign.left,
                          )))
                    ]),
                    const Gap(36),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: [
                          const Gap(10),
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.email),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(teacherEmail),
                                  duration: Duration(seconds: 1),
                                ));
                              },
                            ),
                          ),
                          Flexible(
                            child: IconButton(
                              icon: Icon(Icons.link),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(teacherWebsite),
                                  duration: Duration(seconds: 1),
                                ));
                              },
                            ),
                          ),
                        ])),
                  ],
                ),
              )
            ],
          )));
}
