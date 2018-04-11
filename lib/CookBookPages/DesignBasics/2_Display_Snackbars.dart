import 'package:flutter/material.dart';

void main() => runApp(new SnackBarDemo());

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SnackBar Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('SnackBar Demo'),
        ),
        body: new SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        onPressed: () {
          final snackBar = new SnackBar(
            content: new Text('Yay! A SnackBar!'),
            action: new SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change!
              },
            ),
          );

          // Find the Scaffold in the Widget tree and use it to show a SnackBar!
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: new Text('Show SnackBar'),
      ),
    );
  }
}