import 'package:flutter/material.dart';

class EventRoomChatScreen extends StatefulWidget {
  static String id = 'eventroom_chat_screen';

  @override
  _EventRoomChatScreenState createState() => _EventRoomChatScreenState();
}

class _EventRoomChatScreenState extends State<EventRoomChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(),
    );
  }
}
