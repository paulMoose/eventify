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
      home: DefaultTabController(
        length: monthLenth,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                child: Text('April',style: TextStyle(fontSize: 14.0),),
              ),
              bottom: PreferredSize(
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white.withOpacity(0.3),
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      tabs: tabs,
                  ),
                  preferredSize: Size.fromHeight(15.0)
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 5.0),
                  child: Text('2020',style: TextStyle(fontSize: 14.0),),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            body: TabBarView(
              //TODO:create Widget for daily tasks
              children: tasks,
            )),
      ),
    );
  }
}