import 'package:flutter/material.dart';

class EventRoomMapsScreen extends StatefulWidget {
  static String id = 'eventroom_maps_screen';

  @override
  _EventRoomMapsScreenState createState() => _EventRoomMapsScreenState();
}

class _EventRoomMapsScreenState extends State<EventRoomMapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(),
    );
  }
}
