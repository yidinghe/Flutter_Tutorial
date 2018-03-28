import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Layout Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Top Lakes'),
        ),
      ),
    );
  }
}
