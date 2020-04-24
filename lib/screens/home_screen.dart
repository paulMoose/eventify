import 'package:eventify/screens/browse_screen.dart';
import 'package:eventify/screens/code_screen.dart';
import 'package:eventify/screens/create_screen.dart';
import 'package:eventify/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
//                  Color(0xFF272D2D),
//                  Color(0xFF0CCE6B),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RoundedButtonWidget(
                  title: 'Create event',
                  onPressed: () {
                    Navigator.pushNamed(context, CreateScreen.id);
                  },
                  backgroundColor: Color(0xFF0CCE6B),
                  textColor: Color(0xFFF7FFF6),
                ),
                RoundedButtonWidget(
                  title: 'Browse events',
                  onPressed: () {
                    Navigator.pushNamed(context, BrowseScreen.id);
                  },
                  backgroundColor: Color(0xFF0CCE6B),
                  textColor: Color(0xFFF7FFF6),
                ),
                RoundedButtonWidget(
                  title: 'Enter event code',
                  onPressed: () {
                    Navigator.pushNamed(context, CodeScreen.id);
                  },
                  backgroundColor: Color(0xFF0CCE6B),
                  textColor: Color(0xFFF7FFF6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
