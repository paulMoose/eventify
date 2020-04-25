import 'package:flutter/material.dart';
import 'package:eventify/utils/screen_sizes.dart';

class YearTitleWidget extends StatelessWidget {
  const YearTitleWidget(
    this.year,
  );

  final int year;

  @override
  Widget build(BuildContext context) {
    return Text(
      year.toString(),
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: screenSize(context) == ScreenSizes.small ? 22.0 : 26.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}