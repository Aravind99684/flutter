import 'package:flutter/material.dart';
// example of container widget
void main(List<String> args) {
  runApp(ContainerWidget());
  
}

class ContainerWidget extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Center(
        child:Container( //command to create container, child of body widget
          height: 200.0, // container specifications
          width: 200.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        child: Text("Hello"),  
        ) ,),
    );
  }
}