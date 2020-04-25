import 'package:eventify/widgets/event_card_widget.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  static String id = 'events_screen';

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {

    List<Widget> eventList = [
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
        canView: true,
        canEnter: true,
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
        canView: true,
        canEnter: true,
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
        canView: true,
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
        canView: true,
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
        canView: true,
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
        canView: true,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF272D2D),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'My events',
                      style: TextStyle(
                          color: Color(0xFFF7FFF6),
                          fontWeight: FontWeight.w900,
                          fontSize: 30.0
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: SingleChildScrollView(
                      child: Column(
                        children: eventList,
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
