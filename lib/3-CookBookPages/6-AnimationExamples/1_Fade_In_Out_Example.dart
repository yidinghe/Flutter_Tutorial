import 'package:flutter/material.dart';

final appTitle = 'Opacity Demo';

void main() => runApp(new MaterialApp(
      title: appTitle,
      home: new MyHomePage(
        title: appTitle,
      ),
    ));

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: new Duration(milliseconds: 500),
          child: new Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: new Icon(Icons.flip),
      ),
    );
  }
}
