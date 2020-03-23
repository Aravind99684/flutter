import 'package:flutter/material.dart';
import './gmap.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
     
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Map"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Using Google Maps in Flutter',
                style: TextStyle(fontSize: 42.0),
              ),
              SizedBox(height: 20),
              Text(
                'The google_maps_flutter package is still in the Developers Preview status, so make sure you monitor changes closely when using it.',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.map),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GMap()),
          );
        }
      ),
    );
      
  }
}
