import 'package:eventify/models/event_model.dart';
import 'package:eventify/screens/eventpage_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_home_screen.dart';
import 'package:eventify/widgets/date_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({this.event, this.dateTime, this.canView = false, this.canEnter = false});

  final Event event;
  final EventDateTime dateTime;
  final bool canView;
  final bool canEnter;

  @override
  Widget build(BuildContext context) {

    DateFormat monthName = new DateFormat('MMMM');

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
                  month: monthName.format(dateTime.date),
                  day: dateTime.date.day.toString(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 13.0, left: 5.0),
                child: Container(
                  width: 250.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        event.name,
                        style: TextStyle(
                          color: Color(0xFF272D2D),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        event.location,
                      ),
                      Visibility(
                        visible: this.canView,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                if (this.canView) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => EventPageScreen(event: event)));
                                }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0, right: 20.0),
                                  child: Text("VIEW", style: TextStyle(color: this.canView ? Color(0xFF0CCE6B) : Color(0xFFC3F1CF))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                if (this.canEnter) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => EventRoomHomeScreen(event: event)));
                                }
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