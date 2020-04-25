import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeeklyWidget extends StatelessWidget {
  const WeeklyWidget();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () { 
        //TODO!
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
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Center(
                  child: Text('23')
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