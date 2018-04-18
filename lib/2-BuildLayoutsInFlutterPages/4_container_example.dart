import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var boxDecoration = new BoxDecoration(
      border: new Border.all(width: 10.0, color: Colors.black38),
      borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
    );

    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.black26,
      ),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/pic1.jpg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/pic2.jpg'),
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/pic3.jpg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/pic4.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(child: container),
    );
  }
}
