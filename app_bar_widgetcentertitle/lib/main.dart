import 'package:flutter/material.dart';
// AppBar with center title
void main(List<String> args) {
  runApp(AppBarWidget());
}

class AppBarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // aligns the children along the horizontal direction and put the child in the center.
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Title",
                style: TextStyle(fontSize: 18.0),
              ),
              new Text(
                "subtitle",
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          )
        )
      ),
    );
  }
}