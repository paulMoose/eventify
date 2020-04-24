import 'package:eventify/widgets/logo_image_widget.dart';
import 'package:eventify/widgets/rounded_button_widget.dart';
import 'package:eventify/widgets/transparent_rounded_input_widget.dart';
import 'package:eventify/screens/entry/registration_screen.dart';
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
                LogoImageWidget(),
                TransparentRoundedInputWidget(hintText: 'Enter your email'),
                TransparentRoundedInputWidget(
                    hintText: 'Enter your password', obscureText: true),
                RoundedButtonWidget(
                  title: 'LOG IN',
                  onPressed: () {
                    //Implement registration functionality.
                  },
                  backgroundColor: Color(0xFFF7FFF6),
                  textColor: Color(0xFF272D2D),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    SizedBox(
                      height: 12.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text("Register", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Text("- or -"),
                    GestureDetector(
                      onTap: () {
                        // TODO: Add functionality
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text("Continue as Guest", style: TextStyle(color: Colors.white)),
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


