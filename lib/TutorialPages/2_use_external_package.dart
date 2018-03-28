import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//2_use_external_package

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: "Welcome to Flutter",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Welcome to Flutter"),
        ),
        body: new Center(
          child: new Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}