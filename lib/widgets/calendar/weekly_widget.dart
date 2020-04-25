import 'package:eventify/screens/event_tasks/daily_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeeklyWidget extends StatelessWidget {
  const WeeklyWidget();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () { 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DailyTaskScreen())
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  color: Color(0xFF4E6E5D),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Color(0xFF4E6E5D)),
                ),
                child: Center(
                  child: DefaultTextStyle(
                    style: TextStyle(color: Colors.white),
                    child: Text('23'),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('3 Tasks', style: TextStyle(fontSize: 16.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}