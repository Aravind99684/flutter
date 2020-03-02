import 'package:flutter/material.dart';

void main(List<String> args) {

  runApp(ContainerWidget());
  
} 

class ContainerWidget extends StatelessWidget {

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(25.0),
          decoration: new ShapeDecoration(
            color: Colors.white,
            shadows: <BoxShadow>[
              BoxShadow(color: Colors.black, blurRadius: 15.0)
            ],
            shape: new Border.all(
              color: Colors.red,
              width: 8.0,
            ),
          ),
          child: Center(child: const Text("hello flutter", textAlign: TextAlign.center,))
        ),
      ),
    );
  }
}
