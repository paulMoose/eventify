import 'package:eventify/widgets/event_tasks/tab_bar_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabBarTaskWidget extends StatelessWidget {
  const TabBarTaskWidget();

  @override
  Widget build(BuildContext context) {
    var tabs = <Tab>[];
    var tasks = <TabBarContentWidget>[];
    var month = DateTime(DateTime.now().year, DateTime.now().month, 1);
    var monthLenth = month.subtract(Duration(days: 1)).day;
    for(var i = 1; i <= monthLenth; i++) {
      tabs.add(
        Tab(child: Text(i.toString()),)
      );

      tasks.add(
        TabBarContentWidget()
      );
    }
    
    return DefaultTabController(
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
        body: TabBarView(
          children: tasks,
        )
      ),
    );
  }
}