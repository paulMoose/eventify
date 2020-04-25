import 'package:eventify/screens/event_tasks/daily_task_screen.dart';
import 'package:eventify/screens/event_tasks/calendar_screen.dart';
import 'package:eventify/screens/browse_screen.dart';
import 'package:eventify/screens/code_screen.dart';
import 'package:eventify/screens/create_screen.dart';
import 'package:eventify/screens/eventpage_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_announcements_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_chat_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_files_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_home_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_maps_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_notes_screen.dart';
import 'package:eventify/screens/eventroom/eventroom_schedule_screen.dart';
import 'package:eventify/screens/events_screen.dart';
import 'package:eventify/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:eventify/screens/entry/welcome_screen.dart';
import 'package:eventify/screens/entry/login_screen.dart';
import 'package:eventify/screens/entry/registration_screen.dart';

import 'constants.dart';

void main() => runApp(Eventify());

class Eventify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: CustomColors.aeroBlue,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: CreateScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        DailyTaskScreen.id: (context) => DailyTaskScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        CreateScreen.id: (context) => CreateScreen(),
        CodeScreen.id: (context) => CodeScreen(),
        BrowseScreen.id: (context) => BrowseScreen(),
        EventPageScreen.id: (context) => EventPageScreen(),
        CalendarScreen.id: (context) => CalendarScreen(),
        EventsScreen.id: (context) => EventsScreen(),
        EventRoomHomeScreen.id: (context) => EventRoomHomeScreen(),
        EventRoomAnnouncementsScreen.id: (context) => EventRoomAnnouncementsScreen(),
        EventRoomChatScreen.id: (context) => EventRoomChatScreen(),
        EventRoomScheduleScreen.id: (context) => EventRoomScheduleScreen(),
        EventRoomMapsScreen.id: (context) => EventRoomMapsScreen(),
        EventRoomFilesScreen.id: (context) => EventRoomFilesScreen(),
        EventRoomNotesScreen.id: (context) => EventRoomNotesScreen(),
      },
      supportedLocales: [
        const Locale('en', 'US'), // English
      ],
    );
  }
}
