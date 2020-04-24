import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  static String id = 'events_screen';

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(),
    );
  }
}
