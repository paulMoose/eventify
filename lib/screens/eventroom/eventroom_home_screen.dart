import 'package:eventify/models/event_model.dart';
import 'package:eventify/widgets/eventroom/eventroom_menu_widget.dart';
import 'package:eventify/widgets/navigation_menu_widget.dart';
import 'package:flutter/material.dart';

class EventRoomHomeScreen extends StatefulWidget {
  static String id = 'eventroom_home_screen';

  EventRoomHomeScreen({
    @required this.event,
  });

  final Event event;

  @override
  _EventRoomHomeScreenState createState() => _EventRoomHomeScreenState();
}

class _EventRoomHomeScreenState extends State<EventRoomHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                widget.event.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF272D2D),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
              Text(
                'Event room home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF272D2D),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          EventRoomMenuWidget(event: widget.event),
          NavigationMenuWidget(),
        ],
      ),
    );
  }
}
