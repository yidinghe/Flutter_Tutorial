import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: themeData,
  ));
}

final ThemeData themeData = ThemeData(
  accentColor: Colors.redAccent,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            // Push with class extends Route
            Navigator.push(context, PageTwo());
          },
          child: Text("Go to Page Two"),
        ),
      ),
    );
  }
}

class PageTwo extends MaterialPageRoute<Null> {
  PageTwo()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 1.0,
            ),
            body: Center(
              child: RaisedButton(
                onPressed: () {
                  // Push with class extends StatelessWidget, new Route
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageThree()),
                  );
                },
                child: Text("Go to Page Three"),
              ),
            ),
          );
        });
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Last Page!"),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.popUntil(
                context, ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: Text("Go Home!"),
        ),
      ),
    );
  }
}
