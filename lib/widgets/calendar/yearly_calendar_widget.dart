import 'package:eventify/widgets/calendar/elements/year_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:eventify/utils/screen_sizes.dart';

class ScrollingYearsCalendarWidget extends StatefulWidget {
  ScrollingYearsCalendarWidget({
    @required this.context,
    @required this.initialDate,
    @required this.firstDate,
    @required this.lastDate,
    @required this.currentDateColor,
    this.highlightedDates,
    this.highlightedDateColor,
    this.monthNames,
    this.onMonthTap,
  })  : assert(context != null),
        assert(initialDate != null),
        assert(firstDate != null),
        assert(lastDate != null),
        assert(!initialDate.isBefore(firstDate),
            'initialDate must be on or after firstDate'),
        assert(!initialDate.isAfter(lastDate),
            'initialDate must be on or before lastDate'),
        assert(!firstDate.isAfter(lastDate),
            'lastDate must be on or after firstDate'),
        assert(currentDateColor != null),
        assert(highlightedDates == null || highlightedDateColor != null,
            'highlightedDateColor is required if highlightedDates is not null'),
        assert(
            monthNames == null || monthNames.length == DateTime.monthsPerYear,
            'monthNames must contain all months of the year');

  final BuildContext context;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color currentDateColor;
  final List<DateTime> highlightedDates;
  final Color highlightedDateColor;
  final List<String> monthNames;
  final Function onMonthTap;

  @override
  _ScrollingYearsCalendarState createState() => _ScrollingYearsCalendarState();
}

class _ScrollingYearsCalendarState extends State<ScrollingYearsCalendarWidget> {
  /// Gets a widget with the view of the given year.
  YearViewWidget _getYearView(int year) {
    return YearViewWidget(
      context: context,
      year: year,
      currentDateColor: widget.currentDateColor,
      highlightedDates: widget.highlightedDates,
      highlightedDateColor: widget.highlightedDateColor,
      monthNames: widget.monthNames,
      onMonthTap: widget.onMonthTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final int _itemCount = widget.lastDate.year - widget.firstDate.year + 1;

    // Makes sure the right initial offset is calculated so the listview
    // jumps to the initial year.
    final double _initialOffset =
        (widget.initialDate.year - widget.firstDate.year) *
            getYearViewHeight(context);
    final ScrollController _scrollController =
        ScrollController(initialScrollOffset: _initialOffset);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 16.0),
          controller: _scrollController,
          itemCount: _itemCount,
          itemBuilder: (BuildContext context, int index) {
            final int year = index + widget.firstDate.year;
            return _getYearView(year);
          },
        ),
      ),
    );
  }
}