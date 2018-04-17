import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

Future<Post> fetchPost() async {
  final response = await http.get(
    'https://jsonplaceholder.typicode.com/posts/1',
    headers: {HttpHeaders.AUTHORIZATION: "Basic your_api_token_here"},
  );
  final responseJson = json.decode(response.body);
  return new Post.fromJson(responseJson);
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Fetch Data Example';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(appTitle),
        ),
        body: new Center(
          child: new FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return new Text('${snapshot.error}');
              }
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
