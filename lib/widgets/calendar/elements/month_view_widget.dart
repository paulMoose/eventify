import 'package:eventify/screens/event_tasks/weeks_calendar_screen.dart';
import 'package:eventify/widgets/calendar/elements/day_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:eventify/utils/dates.dart';
import 'package:eventify/utils/screen_sizes.dart';
import 'package:eventify/widgets/calendar/elements/month_title_widget.dart';

class MonthViewWidget extends StatelessWidget {
  const MonthViewWidget({
    @required this.context,
    @required this.year,
    @required this.month,
    @required this.padding,
    @required this.currentDateColor,
    this.highlightedDates,
    this.highlightedDateColor,
    this.monthNames,
    this.onMonthTap,
  });

  final BuildContext context;
  final int year;
  final int month;
  final double padding;
  final Color currentDateColor;
  final List<DateTime> highlightedDates;
  final Color highlightedDateColor;
  final List<String> monthNames;
  final Function onMonthTap;

  Color getDayNumberColor(DateTime date) {
    Color color;
    if (isCurrentDate(date)) {
      color = currentDateColor;
    } else if (highlightedDates != null &&
        isHighlightedDate(date, highlightedDates)) {
      color = highlightedDateColor;
    }
    return color;
  }

  Widget buildMonthDays(BuildContext context) {
    final List<Row> dayRows = <Row>[];
    final List<DayNumberWidget> dayRowChildren = <DayNumberWidget>[];

    final int daysInMonth = getDaysInMonth(year, month);
    final int firstWeekdayOfMonth = DateTime(year, month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      Color color;
      if (day > 0) {
        color = getDayNumberColor(DateTime(year, month, day));
      }

      dayRowChildren.add(
        DayNumberWidget(
          day: day,
          color: color,
        ),
      );

      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(
          Row(
            children: List<DayNumberWidget>.from(dayRowChildren),
          ),
        );
        dayRowChildren.clear();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dayRows,
    );
  }

  Widget buildMonthView(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WeeksCalendarScreen())
        );
      },
      padding: EdgeInsets.all(0),
      child: Container(
        width: 7 * getDayNumberSize(context),
        margin: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MonthTitleWidget(
              month: month,
              monthNames: monthNames,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: buildMonthDays(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return onMonthTap == null
        ? Container(
            child: buildMonthView(context),
          )
        : FlatButton(
            onPressed: () => this.onMonthTap(year, month),
            padding: const EdgeInsets.all(0.0),
            child: buildMonthView(context),
          );
  }
}