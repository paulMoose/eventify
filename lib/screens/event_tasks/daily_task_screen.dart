import 'package:eventify/widgets/event_tasks/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DailyTaskScreen extends StatefulWidget {
  static String id = 'daily_task_screen';

  @override
  _DailyTaskScreen createState() =>_DailyTaskScreen();
}

class _DailyTaskScreen extends State<DailyTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var tabs = <Tab>[];
    var tasks = <Widget>[];
    var month = DateTime(DateTime.now().year, DateTime.now().month, 1);
    var monthLenth = month.subtract(Duration(days: 1)).day;
    for(var i = 1; i <= monthLenth; i++) {
      tabs.add(
        Tab(child: Text(i.toString()),)
      );

      tasks.add(
        Container(child: Center(child: Text('Tab ' + i.toString())))
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF4E6E5D),
        accentColor: Colors.white,
      ),
      home: TabBarWidget(),
    );
  }
}