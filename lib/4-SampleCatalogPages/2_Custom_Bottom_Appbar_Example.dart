import 'package:flutter/material.dart';

void main() => runApp(new AppBarBottomSample());

class AppBarBottomSample extends StatefulWidget {
  @override
  _AppBarBottomSampleState createState() => new _AppBarBottomSampleState();
}

class _AppBarBottomSampleState extends State<AppBarBottomSample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: choices.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    num animateToIndex = 0;
    if (newIndex < 0) {
      animateToIndex = choices.length - 1;
    } else if (newIndex >= choices.length) {
      animateToIndex = 0;
    } else {
      animateToIndex = newIndex;
    }
    _tabController.animateTo(animateToIndex);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'AppBar Bottom Widget',
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
          leading: new IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _nextPage(-1);
            },
          ),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                _nextPage(1);
              },
            )
          ],
          bottom: new PreferredSize(
              child: new Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: new Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: new TabPageSelector(controller: _tabController),
                ),
              ),
              preferredSize: const Size.fromHeight(48.0)),
        ),
        body: new TabBarView(
          children: choices.map((Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new ChoiceCard(
                choice: choice,
              ),
            );
          }).toList(),
          controller: _tabController,
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  const ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
