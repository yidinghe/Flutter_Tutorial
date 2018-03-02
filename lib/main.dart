import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {

    final _biggerFont = const TextStyle(fontSize: 10.0);

    Widget _buildListItem(WordPair pair) {
      final alreadySaved = _saved.contains(pair);

      return new ListTile(
        title: new Text(pair.asPascalCase, style: _biggerFont),
        trailing: new Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
        onTap: () {
          setState(
                  () {
                if (alreadySaved) {
                  _saved.remove(pair);
                } else {
                  _saved.add(pair);
                }
              });
        },
      );
    }

    Widget _buildListView() {
      return new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) {
              return new Divider();
            }
            final index = i ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildListItem(_suggestions[index]);
          });
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildListView(),
    );
  }
}