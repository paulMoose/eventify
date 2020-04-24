import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200.0,
          child: Image.asset('images/logo.png'),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'EVENTIFY',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 50.0),
          ),
        ),
      ],
    );
  }
}