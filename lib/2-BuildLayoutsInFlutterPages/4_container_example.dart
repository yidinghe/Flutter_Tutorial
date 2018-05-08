import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      border: Border.all(width: 10.0, color: Colors.black38),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );

    var container = Container(
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: boxDecoration,
                  margin: EdgeInsets.all(4.0),
                  child: Image.asset('images/pic1.jpg'),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: boxDecoration,
                  margin: EdgeInsets.all(4.0),
                  child: Image.asset('images/pic2.jpg'),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: boxDecoration,
                  margin: EdgeInsets.all(4.0),
                  child: Image.asset('images/pic3.jpg'),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: boxDecoration,
                  margin: EdgeInsets.all(4.0),
                  child: Image.asset('images/pic4.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: container),
    );
  }
}
