import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "1_hello_world",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("1_hello_world"),
        ),
        body: new Center(
          child: new Text("Hello World, Flutter."),
        ),
      ),
    );
  }

}