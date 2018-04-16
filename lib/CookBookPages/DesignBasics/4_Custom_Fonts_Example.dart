import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Custom Fonts',
      // Set Raleway as the default app font
      theme: new ThemeData(fontFamily: 'woff'),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // The AppBar will use the app-default Raleway font
      appBar: new AppBar(title: new Text('Custom Fonts')),
      body: new Center(
        // This Text Widget will use the RobotoMono font
        child: new Text(
          'Font Komi sample',
          style: new TextStyle(fontFamily: 'komi'),
        ),
      ),
    );
  }
}