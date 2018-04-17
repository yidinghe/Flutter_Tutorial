import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'Transition Demo',
      home: new MainScreen(),
    ));

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Main Screen'),
      ),
      body: new GestureDetector(
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (_) {
            return new DetailScreen();
          }));
        },
        child: new Hero(
          tag: 'imageHero',
          child: new Image.network(
            'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: new Center(
          child: new Hero(
            tag: 'imageHero',
            child: new Image.network(
              'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
