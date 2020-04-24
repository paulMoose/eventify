import 'package:eventify/components/rounded_button.dart';
import 'package:eventify/components/transparent_rounded_input.dart';
import 'package:eventify/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF6AF3C5),
                  Color(0xFF3D77F8),
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
                SizedBox(
                  height: 48.0,
                ),
                TransparentRoundedInput(hintText: 'Enter your email'),
                TransparentRoundedInput(
                    hintText: 'Enter your password', obscureText: true),
                RoundedButton(
                  title: 'LOG IN',
                  onPressed: () {
                    //Implement registration functionality.
                  },
                  backgroundColor: Color(0xFFF7FFF6),
                  textColor: Color(0xFF3D77F8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Dont't have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text("Register", style: TextStyle(color: Colors.white)),
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
