import 'package:eventify/screens/event_tasks/daily_task_screen.dart';
import 'package:eventify/widgets/calendar/weekly_widget.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  static String id = 'calendar_screen';

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    var tabs = <Tab>[
    Tab(child: Text('Today'),),
    Tab(child: Text('Week'),),
    Tab(child: Text('Year'),)
  ];

  var weeklyContent = <Widget>[];
  for(var i = 0 ; i < 3 ; i++) {
    weeklyContent.add(
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).accentColor,
              width: 0.5,
            )
          ),
        ),
        child: WeeklyWidget(),
      ),
    );
  }

  var content = <Widget>[
    DailyTaskScreen(),
    Container(
      child: Column(
        children: weeklyContent,
      )
    ),
    Container(child: Text('Year')),
  ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF4E6E5D),
        accentColor: Color(0xFF272D2D),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              titleSpacing: 0.0,
              title: Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: DefaultTextStyle(
                        style: TextStyle(color: Colors.white70),
                        child: Text('Today')
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DailyTaskScreen())
                        );
                      },
                    ),
                    FlatButton(
                      child: Container(
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            )
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 9.0, bottom: 9.0),
                            child: DefaultTextStyle(
                              style: TextStyle(color: Colors.white),
                              child: Text('Weekly')
                            ),
                          ),
                        )
                      ),
                      onPressed: () {
                        //TODO
                      },
                    ),
                    FlatButton(
                      child: DefaultTextStyle(
                        style: TextStyle(color: Colors.white70),
                        child: Text('Yearly')
                      ),
                      onPressed: () {
                        //TODO
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => DailyTaskScreen())
                        // );
                      },
                    ),
                  ],
                ),
              ), 
            ),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: weeklyContent,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
