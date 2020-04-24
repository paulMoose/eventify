import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget(
      {this.title, this.backgroundColor, this.textColor, @required this.onPressed});

  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Material(
        color: this.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: MaterialButton(
          onPressed: this.onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            this.title,
            style: TextStyle(color: this.textColor),
          ),
        ),
      ),
    );
  }
}