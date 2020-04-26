import 'package:eventify/constants.dart';
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
                      Container(
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(),
                                    SizedBox(width: 15.0),
                                    Container(
                                      width: constraints.maxWidth - 55,
                                      child: Text(
                                        'My Name',
                                        style: TextStyle(
                                          color: Color(0xFFC3F1CF),
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                              ],
                            );
                          }
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            open = false;
                          });
                          Navigator.pushNamed(context, EventRoomHomeScreen.id);
                        },
                        child: Text(
                        'Home'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            open = false;
                          });
                          Navigator.pushNamed(context, EventRoomAnnouncementsScreen.id);
                        },
                        child: Text(
                          'Announcements'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            open = false;
                          });
                          Navigator.pushNamed(context, EventRoomChatScreen.id);
                        },
                        child: Text(
                          'Chatroom'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            open = false;
                          });
                          Navigator.pushNamed(context, EventRoomScheduleScreen.id);
                        },
                        child: Text(
                          'Schedule'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            open = false;
                          });
                          Navigator.pushNamed(context, EventRoomMapsScreen.id);
                        },
                        child: Text(
                          'Maps'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            open = false;
                          });
                          Navigator.pushNamed(context, EventRoomFilesScreen.id);
                        },
                        child: Text(
                          'Files'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            open = false;
                          });
                          Navigator.pushNamed(context, EventRoomNotesScreen.id);
                        },
                        child: Text(
                          'Notes'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 120.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        color: CustomColors.hookersGreen,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        )
                    ),
                    child: IconButton(
                      icon: Icon(
                        open ? Icons.clear : Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: (){
                        setState(() {
                          open = !open;
                        });
                      },
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