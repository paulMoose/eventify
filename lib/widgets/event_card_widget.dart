import 'package:eventify/screens/eventpage_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_home_screen.dart';
import 'package:eventify/widgets/date_widget.dart';
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({this.month, this.day, this.title, this.description, this.canView = false, this.canEnter = false});

  final String month;
  final String day;
  final String title;
  final String description;
  final bool canView;
  final bool canEnter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: Color(0xFFF7FFF6),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          height: 100,
          child: Row(
            children: <Widget>[
              Container(
                width: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  color: Color(0xFFC3F1CF),
                ),
              ),
              DateWidget(
                  month: this.month,
                  day: this.day,
              ),
              Padding(
                padding: EdgeInsets.only(top: 13.0, left: 5.0),
                child: Container(
                  width: 250.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        this.title,
                        style: TextStyle(
                          color: Color(0xFF272D2D),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        this.description,
                      ),
                      Visibility(
                        visible: this.canView,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
//                                if (this.canView) {
//                                  Navigator.pushNamed(context, EventPageScreen.id);
//                                }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0, right: 20.0),
                                  child: Text("VIEW", style: TextStyle(color: this.canView ? Color(0xFF0CCE6B) : Color(0xFFC3F1CF))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
//                                if (this.canEnter) {
//                                  Navigator.pushNamed(context, EventRoomHomeScreen.id);
//                                }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0, right: 20.0),
                                  child: Text("ENTER", style: TextStyle(color: this.canEnter ? Color(0xFF0CCE6B) : Color(0xFFC3F1CF))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}