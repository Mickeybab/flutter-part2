import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function onPress;

  MyButton({this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.orange,
          shadowColor: Colors.grey,
          elevation: 5,
        ),
        child: Padding(
          child: Text(
            this.text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          padding: EdgeInsets.all(10.0),
        ),
        onPressed: this.onPress,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 2))
      ]),
    );
  }
}
