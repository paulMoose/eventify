import 'package:eventify/widgets/date_widget.dart';
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({this.month, this.day, this.title, this.description});

  final String month;
  final String day;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: Color(0xFFF7FFF6),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          height: 100,
          child: Row(
            children: <Widget>[
              Container(
                width: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  color: Color(0xFFC3F1CF),
                ),
              ),
              DateWidget(
                  month: this.month,
                  day: this.day,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Container(
                  width: 100.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        Text(
                          this.title,
                          style: TextStyle(
                            color: Color(0xFF272D2D),
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      Text(
                        this.description,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}