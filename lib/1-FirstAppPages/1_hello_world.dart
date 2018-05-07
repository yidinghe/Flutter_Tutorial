import 'package:flutter/material.dart';

//1_hello_world

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "1_hello_world",
      home: Scaffold(
        appBar: AppBar(
          title: Text("1_hello_world"),
        ),
        body: Center(
          child: Text("Hello World, Flutter."),
        ),
      ),
    );
  }
}
