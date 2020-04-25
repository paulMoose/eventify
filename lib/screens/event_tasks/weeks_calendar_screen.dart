import 'package:eventify/screens/event_tasks/daily_task_screen.dart';
import 'package:eventify/screens/event_tasks/years_calendar_screen.dart';
import 'package:eventify/widgets/calendar/elements/month_view_widget.dart';
import 'package:eventify/widgets/calendar/weekly_widget.dart';
import 'package:flutter/material.dart';

class WeeksCalendarScreen extends StatefulWidget {
  static String id = 'calendar_screen';

  @override
  _WeeksCalendarScreenState createState() => _WeeksCalendarScreenState();
}

class _WeeksCalendarScreenState extends State<WeeksCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    var tabs = <Tab>[
    Tab(child: Text('Today'),),
    Tab(child: Text('Week'),),
    Tab(child: Text('Year'),)
  ];

  var weeklyContent = <Widget>[];
  for(var i = 0 ; i < 5 ; i++) {
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
                              child: Text('Week')
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
                        child: Text('Year')
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => YearsCalendarScreen())
                        );
                      },
                    ),
                  ],
                ),
              ), 
            ),
          ),
          body: Container(
            color: Color(0xFFC3F1CF),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                    )
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Transform.scale(
                    scale: 2.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Center(
                          child: MonthViewWidget(
                            context: context,
                            year: 2020,
                            month: 2,
                            padding: 10.0,
                            currentDateColor: Theme.of(context).primaryColor,
                            highlightedDates: [],
                            highlightedDateColor: Theme.of(context).accentColor,
                            monthNames: ['Jan','Feb'],
                            onMonthTap: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Color(0xFFFDE6BB),
                  height: (MediaQuery.of(context).size.height) / 2,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
