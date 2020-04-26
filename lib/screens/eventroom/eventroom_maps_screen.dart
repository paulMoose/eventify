import 'package:eventify/models/event_model.dart';
import 'package:eventify/widgets/eventroom/eventroom_menu_widget.dart';
import 'package:flutter/material.dart';

class EventRoomMapsScreen extends StatefulWidget {
  static String id = 'eventroom_maps_screen';

  EventRoomMapsScreen({
    @required this.event,
  });

  final Event event;

  @override
  _EventRoomMapsScreenState createState() => _EventRoomMapsScreenState();
}

class _EventRoomMapsScreenState extends State<EventRoomMapsScreen> {
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
              Container(
                child: Text(
                  'Event room maps',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF272D2D),
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          EventRoomMenuWidget(event: widget.event),
        ],
      ),
    );
  }
}
