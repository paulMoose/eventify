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
      body: Stack(),
    );
  }
}
