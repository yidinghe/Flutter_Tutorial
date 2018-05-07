import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Example',
      theme: ThemeData.dark(),
      home: ScopedModel<AppModel>(
        model: AppModel(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final AppModel appModelOne = AppModel();
  final AppModel appModelTwo = AppModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scoped Model Counter'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ScopedModel<AppModel>(
                model: appModelOne,
                child: Counter(
                  counterName: 'App Model One',
                ),
              ),
              ScopedModel<AppModel>(
                model: appModelTwo,
                child: Counter(
                  counterName: 'App Model Two',
                ),
              ),
            ],
          ),
        ));
  }
}

class Counter extends StatelessWidget {
  final String counterName;

  Counter({Key key, this.counterName});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("$counterName:"),
              Text(
                model.count.toString(),
                style: Theme.of(context).textTheme.display1,
              ),
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: model.increment,
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: model.decrement,
                  )
                ],
              )
            ],
          ),
    );
  }
}
