import 'package:eventify/constants.dart';
import 'package:eventify/widgets/event_tasks/tab_bar_task_widget.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: CustomColors.deepSpaceSparkle,
        accentColor: CustomColors.charlestonGreen,
      ),
      home: TabBarTaskWidget(),
    );
  }
}