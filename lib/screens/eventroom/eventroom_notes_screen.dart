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
      body: Stack(),
    );
  }
}
