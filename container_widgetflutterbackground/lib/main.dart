import 'package:flutter/material.dart';

void main(List<String> args) {}

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: new Text("Flutter"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {}
            ),
          new IconButton(
            icon: new Icon(Icons.add), 
            onPressed: () {}
            ),
        ],
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(25.0),
        decoration: FlutterLogoDecoration(), // uses the flutter logo as the decoration of the body

      )
    );
  }
}
