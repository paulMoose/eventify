import 'package:flutter/material.dart';
import 'package:eventify/utils/dates.dart';

class MonthTitleWidget extends StatelessWidget {
  const MonthTitleWidget({
    @required this.month,
    this.monthNames,
  });

  final int month;
  final List<String> monthNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        getMonthName(month, monthNames: monthNames),
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Geo',
          color: Theme.of(context).primaryColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false,
      ),
    );
  }
}