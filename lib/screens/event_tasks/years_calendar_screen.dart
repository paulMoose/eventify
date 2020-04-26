import 'package:eventify/constants.dart';
import 'package:eventify/widgets/calendar/yearly_calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YearsCalendarScreen extends StatefulWidget {
  static String id = 'years_calendar_screen';

  @override
  _YearsCalendarScreen createState() =>_YearsCalendarScreen();
}

class _YearsCalendarScreen extends State<YearsCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: CustomColors.hookersGreen,
        accentColor: CustomColors.charlestonGreen,
      ),
      home: Center(
        child: ScrollingYearsCalendarWidget(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 5 * 365)),
          lastDate: DateTime.now(),
          currentDateColor: CustomColors.frenchBistre,
        ),
      ),
    );
  }
}