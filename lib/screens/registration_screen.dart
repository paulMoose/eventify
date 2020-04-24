import 'package:eventify/components/logo_image.dart';
import 'package:eventify/components/rounded_button.dart';
import 'package:eventify/components/transparent_rounded_input.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Background gradient
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF272D2D),
                  Color(0xFF0CCE6B),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                LogoImage(),
                TransparentRoundedInput(hintText: 'Enter your email'),
                TransparentRoundedInput(
                    hintText: 'Enter your password', obscureText: true),
                TransparentRoundedInput(
                    hintText: 'Confirm your password', obscureText: true),
                RoundedButton(
                  title: 'REGISTER',
                  onPressed: () {
                    //Implement registration functionality.
                  },
                  backgroundColor: Color(0xFFF7FFF6),
                  textColor: Color(0xFF3D77F8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text("Log in", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
