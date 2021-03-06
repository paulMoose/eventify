import 'dart:math';
import 'dart:core';

import 'package:eventify/constants.dart';
import 'package:eventify/widgets/event_tasks/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabBarContentWidget extends StatelessWidget {
  const TabBarContentWidget();

  @override
  Widget build(BuildContext context) {
    var tasks = <Widget>[];
    var length = Random().nextInt(6);
    var color1 = CustomColors.bananaMania;
    var color2 = CustomColors.aeroBlue;
    var fontColor = CustomColors.charlestonGreen;
    var white = Colors.white;
    for (var i = 0; i < length; i++) {
      var color = i.isEven ? color1 : color2;
      var bgColor = i.isEven ? color2 : color1;

      tasks.add(
        Container(
          color: i != length-1 ? bgColor : white,
          child: DefaultTextStyle(
            style: TextStyle(color: i.isEven ? Colors.black87 : fontColor),
            child: Container (
              height: 150.0,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                )
              ),
              child: TaskWidget(),
            ),
          )
        )
      );
    }

    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: tasks,
            )
          ],
        ),
      ),
    );
  }
}