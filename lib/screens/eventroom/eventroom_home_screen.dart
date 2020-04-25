import 'package:eventify/widgets/eventroom/eventroom_menu_widget.dart';
import 'package:eventify/widgets/navigation_menu_widget.dart';
import 'package:flutter/material.dart';

class EventRoomHomeScreen extends StatefulWidget {
  static String id = 'eventroom_home_screen';

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
              Container(
                child: Text(
                  'Event room home',
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
          NavigationMenuWidget(),
        ],
      ),
    );
  }
}
