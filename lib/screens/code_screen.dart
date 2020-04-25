import 'package:eventify/screens/eventpage_screen.dart';
import 'package:eventify/widgets/navigation_menu_widget.dart';
import 'package:eventify/widgets/transparent_rounded_input_widget.dart';
import 'package:eventify/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class CodeScreen extends StatefulWidget {
  static String id = 'code_screen';

  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272D2D),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Enter event code',
                    style: TextStyle(
                        color: Color(0xFFF7FFF6),
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                TransparentRoundedInputWidget(
                  hintText: 'Event code',
                ),
                RoundedButtonWidget(
                  title: 'SEARCH',
                  onPressed: () {
                    Navigator.pushNamed(context, EventPageScreen.id);
                  },
                  backgroundColor: Color(0xFF0CCE6B),
                  textColor: Color(0xFFF7FFF6),
                ),

              ],
            ),
          ),
          NavigationMenuWidget(),
        ],
      ),
    );
  }
}
