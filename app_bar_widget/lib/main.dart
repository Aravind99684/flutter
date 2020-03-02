import 'package:flutter/material.dart';
// app bar with multiple icons.
void main(List<String> args) {
  runApp(AppBarWidget());
}

class AppBarWidget extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: new Text("Title"),
        actions: <Widget>[
          new IconButton(
            icon:new Icon(Icons.search),
            onPressed: () {} ,
            ),
          new IconButton(
            icon: new Icon(Icons.add),
             onPressed: () {},
             ),
        ]
      ),
    );
  }
}