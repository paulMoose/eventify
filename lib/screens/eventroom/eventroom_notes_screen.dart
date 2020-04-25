import 'package:eventify/widgets/eventroom/eventroom_menu_widget.dart';
import 'package:flutter/material.dart';

class EventRoomNotesScreen extends StatefulWidget {
  static String id = 'eventroom_notes_screen';

  @override
  _EventRoomNotesScreenState createState() => _EventRoomNotesScreenState();
}

class _EventRoomNotesScreenState extends State<EventRoomNotesScreen> {
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
                  'Event room notes',
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
          EventRoomMenuWidget(),
        ],
      ),
    );
  }
}
