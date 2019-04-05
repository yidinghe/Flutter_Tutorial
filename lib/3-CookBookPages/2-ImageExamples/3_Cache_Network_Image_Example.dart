import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Cached Images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: CachedNetworkImage(
            placeholder: (context, url) => new CircularProgressIndicator(),
            imageUrl:
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}
