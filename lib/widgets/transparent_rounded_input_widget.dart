import 'package:flutter/material.dart';

class TransparentRoundedInputWidget extends StatelessWidget {
  TransparentRoundedInputWidget(
      {this.hintText, this.obscureText = false, this.autofocus = false, this.onChaged});

  final String hintText;
  final bool obscureText;
  final bool autofocus;
  final Function onChaged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onChanged: onChaged,
        autofocus: this.autofocus,
        obscureText: this.obscureText,
        decoration: InputDecoration(
          hintText: this.hintText,
          fillColor: Colors.white24,
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54, width: 0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54, width: 0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}
