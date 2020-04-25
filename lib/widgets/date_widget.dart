import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({this.month, this.day});

  final String month;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF272D2D)),
            color: Color(0xFF272D2D)
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: 60.0,
                color: Color(0xFFFFFFFF),
                child: Align(
                  child: Text(
                    this.month.toUpperCase(),
                    style: TextStyle(
                      color: Color(0xFF272D2D),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 3.0),
              ),
              Text(
                this.day,
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                ),
              ),
            ],
        ),
      ),
    );
  }
}