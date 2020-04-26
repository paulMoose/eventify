import 'package:eventify/constants.dart';
import 'package:eventify/screens/entry/login_screen.dart';
import 'package:eventify/screens/event_tasks/daily_task_screen.dart';
import 'package:eventify/screens/event_tasks/years_calendar_screen.dart';
import 'package:eventify/screens/events_screen.dart';
import 'package:eventify/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationMenuWidget extends StatefulWidget {
  @override
  _NavigationMenuWidgetState createState() => _NavigationMenuWidgetState();
}

class ButtonInfo {
  const ButtonInfo({this.icon, this.id, this.title});

  final IconData icon;
  final String id;
  final String title;
}

class _NavigationMenuWidgetState extends State<NavigationMenuWidget> {
  bool open = false;

  List<ButtonInfo> buttonList = [
    ButtonInfo(icon: Icons.home, id: HomeScreen.id, title: 'Home'),
    ButtonInfo(icon: Icons.assignment, id: DailyTaskScreen.id, title: 'Daily Tasks'),
    ButtonInfo(icon: Icons.calendar_today, id: YearsCalendarScreen.id, title: 'Calendar'),
    ButtonInfo(icon: Icons.book, id: EventsScreen.id, title: 'Events'),
    ButtonInfo(icon: Icons.contacts, id: HomeScreen.id, title: 'Contacts'),
    ButtonInfo(icon: Icons.message, id: HomeScreen.id, title: 'Messaging'),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Transform.translate(
          offset: open ? Offset(0.0, 0.0) : Offset(0.0, MediaQuery.of(context).size.height/2 - 60),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: CustomColors.deepSpaceSparkle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5.0,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: LayoutBuilder(
                            builder: (BuildContext context2, BoxConstraints constraints2) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: constraints2.maxWidth/5,
                                      child: IconButton(
                                        icon: Icon(
                                            Icons.home,
                                            color: Colors.white,
                                            size: 35.0
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            open = false;
                                          });
                                          Navigator.pushNamed(context, HomeScreen.id);
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: constraints2.maxWidth/5,
                                      child: IconButton(
                                        icon: Icon(
                                            Icons.assignment,
                                            color: Colors.white,
                                            size: 32.0
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            open = false;
                                          });
                                          Navigator.pushNamed(context, DailyTaskScreen.id);
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: constraints2.maxWidth/5,
                                    ),
                                    Container(
                                      width: constraints2.maxWidth/5,
                                      child: IconButton(
                                        icon: Icon(
                                            Icons.calendar_today,
                                            color: Colors.white,
                                            size: 32.0
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            open = false;
                                          });
                                          Navigator.pushNamed(context, YearsCalendarScreen.id);
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: constraints2.maxWidth/5,
                                      child: IconButton(
                                        icon: Icon(
                                            Icons.book,
                                            color: Colors.white,
                                            size: 32.0
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            open = false;
                                          });
                                          Navigator.pushNamed(context, EventsScreen.id);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight/2 - 60 - 70,
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  color: Colors.white,
                                )
                            )
                          ),
                          child: GridView.count(
                              crossAxisCount: 4,
                              padding: EdgeInsets.all(0.0),
                            children: <Widget>[
                              for(ButtonInfo info in buttonList)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                        info.icon,
                                        color: Colors.white,
                                        size: 35.0
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        open = false;
                                      });
                                      Navigator.pushNamed(context, info.id);
                                    },
                                  ),
                                  Text(
                                    info.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: LayoutBuilder(
                            builder: (BuildContext context2, BoxConstraints constraints2) {
                              return Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: constraints2.maxWidth/5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                              Icons.exit_to_app,
                                              color: Colors.white,
                                              size: 30.0
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              open = false;
                                            });
                                            Navigator.pushNamed(context, LoginScreen.id);
                                          },
                                        ),
                                        Text(
                                          'Log out',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.0
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    open = !open;
                  });
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 5.0,
                        )
                      ]
                    ),
                    child: Icon(
                      open ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                      color: CustomColors.deepSpaceSparkle,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}