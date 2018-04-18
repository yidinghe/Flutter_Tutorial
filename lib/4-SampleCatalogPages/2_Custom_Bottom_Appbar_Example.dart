import 'package:flutter/material.dart';

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  const ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
  }
}
