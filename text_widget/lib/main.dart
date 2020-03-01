import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Widgets are classes used for building user interfaces",
          textAlign: TextAlign.center, // aligns the text to the specified side.
          textDirection: TextDirection.ltr, // sets the text direction from left to right.
          overflow: TextOverflow.ellipsis, // creates muktiole lines of text.
          maxLines: 2,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
            wordSpacing: 40.0,
            decoration: TextDecoration.overline,
            decorationStyle: TextDecorationStyle.wavy,

          ),

        )
      ),
    );
  }
}