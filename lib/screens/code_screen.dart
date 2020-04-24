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
      backgroundColor: Colors.white,
      body: Stack(),
    );
  }
}
