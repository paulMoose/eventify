import 'package:eventify/screens/eventroom/eventroom_announcements_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_chat_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_files_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_home_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_maps_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_notes_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_schedule_screen.dart';
import 'package:flutter/material.dart';

class EventRoomMenuWidget extends StatefulWidget {

  @override
  _EventRoomMenuWidgetState createState() => _EventRoomMenuWidgetState();
}

class _EventRoomMenuWidgetState extends State<EventRoomMenuWidget> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: open ? Offset(0.0, 0.0) : Offset(- MediaQuery.of(context).size.width/3 * 2, 0.0),
      child: Container(
        color: Colors.red.withOpacity(0.0),
        width: MediaQuery.of(context).size.width/3 * 2 + 50.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Color(0xFF4E6E5D),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width/3 * 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          open = !open;
                          Navigator.pushNamed(context, EventRoomHomeScreen.id);
                        },
                        child: Text(
                        'Home',
                          style: TextStyle(
                            color: Color(0xFFC3F1CF),
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          open = !open;
                          Navigator.pushNamed(context, EventRoomAnnouncementsScreen.id);
                        },
                        child: Text(
                          'Announcements',
                          style: TextStyle(
                            color: Color(0xFFC3F1CF),
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          open = !open;
                          Navigator.pushNamed(context, EventRoomChatScreen.id);
                        },
                        child: Text(
                          'Chatroom',
                          style: TextStyle(
                            color: Color(0xFFC3F1CF),
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          open = !open;
                          Navigator.pushNamed(context, EventRoomScheduleScreen.id);
                        },
                        child: Text(
                          'Schedule',
                          style: TextStyle(
                            color: Color(0xFFC3F1CF),
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          open = !open;
                          Navigator.pushNamed(context, EventRoomMapsScreen.id);
                        },
                        child: Text(
                          'Maps',
                          style: TextStyle(
                            color: Color(0xFFC3F1CF),
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          open = !open;
                          Navigator.pushNamed(context, EventRoomFilesScreen.id);
                        },
                        child: Text(
                          'Files',
                          style: TextStyle(
                            color: Color(0xFFC3F1CF),
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          open = !open;
                          Navigator.pushNamed(context, EventRoomNotesScreen.id);
                        },
                        child: Text(
                          'Notes',
                          style: TextStyle(
                            color: Color(0xFFC3F1CF),
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    open = !open;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF4E6E5D),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}