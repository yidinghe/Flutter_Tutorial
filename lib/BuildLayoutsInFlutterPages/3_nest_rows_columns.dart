import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build titleSection

    return new MaterialApp(
      title: 'Flutter Layout Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(
        title: 'Strawberry Pavlova Recipe',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title,
        ),
      ),
      body: new Center(
        child: new Container(
          margin: new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
          height: 600.0,
          child: new Card(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: 440.0,
                  child: new Image.asset(
                    'images/lake.jpg',
                    width: 300.0,
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
