import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Tomorrow 6:00am'),
              Text('Announce Welcome'),
            ],
          )
        )
      ],
    );
  }
}