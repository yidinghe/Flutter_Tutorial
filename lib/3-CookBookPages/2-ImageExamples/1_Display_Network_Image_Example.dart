import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new ListView(
            children: <Widget>[
              new Image.network(
                'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true',
              ),
              new Image.network(
                  'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true'),
            ],
          )),
    );
  }
}
