import 'package:flutter/material.dart';

// AppBar with text theme and icon theme
void main(List<String> args) {
  runApp(AppBarWidget());
}

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Title"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {},
          )
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0
          ),
        ),
      ),
    );
  }
}
