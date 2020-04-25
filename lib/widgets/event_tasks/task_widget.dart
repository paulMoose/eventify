import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Tomorrow 6:00am'), //Row
                        Container(
                          width: MediaQuery.of(context).size.width - 32,
                          child: Text('Announce Message', style: TextStyle(fontSize: 24.0))
                        ),
                      ]
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Participants', style: TextStyle(fontSize: 12.0)),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    left: 15.0,
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: AssetImage('images/avatar1.png'),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 15.0,
                                    backgroundImage: AssetImage('images/avatar2.png'),
                                  ),
                                ],
                              ),
                            ),
                            Text('Joanna, Paul and 10 others'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        )
      ],
    );
  }
}