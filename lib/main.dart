import 'package:flutter/material.dart';
import 'package:eventify/screens/welcome_screen.dart';
import 'package:eventify/screens/login_screen.dart';
import 'package:eventify/screens/registration_screen.dart';

void main() => runApp(Eventify());

class Eventify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
