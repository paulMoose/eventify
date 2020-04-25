import 'package:eventify/widgets/eventroom/eventroom_menu_widget.dart';
import 'package:flutter/material.dart';

class EventRoomAnnouncementsScreen extends StatefulWidget {
  static String id = 'eventroom_announcements_screen';

  @override
  _EventRoomAnnouncementsScreenState createState() => _EventRoomAnnouncementsScreenState();
}

class _EventRoomAnnouncementsScreenState extends State<EventRoomAnnouncementsScreen> {
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
                  'Event room announcements',
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
