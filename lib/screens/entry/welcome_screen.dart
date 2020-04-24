import 'package:eventify/widgets/rounded_button_widget.dart';
import 'package:eventify/widgets/transparent_rounded_input_widget.dart';
import 'package:eventify/screens/entry/login_screen.dart';
import 'package:eventify/screens/entry/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: Stack()
      body: Center(
        child: Text(
          'Hello, world!',
          textDirection: TextDirection.ltr,
        ),
      )
    );
  }
}
