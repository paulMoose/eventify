import 'package:flutter/material.dart';

class EventPageScreen extends StatefulWidget {
  static String id = 'eventpage_screen';

  @override
  _EventPageScreenState createState() => _EventPageScreenState();
}

class _EventPageScreenState extends State<EventPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(),
    );
  }
}
