import 'package:flutter/material.dart';

//TODO evaluate the logic part

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Layout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Calculator(),
    );
  }
}

class CalculatorLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainState = MainState.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blueGrey.withOpacity(0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    mainState.inputValue ?? '0',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 48.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: <Widget>[
                  makeBtns('C<%/'),
                  makeBtns('789x'),
                  makeBtns('456-'),
                  makeBtns('123+'),
                  makeBtns('_0.='),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget makeBtns(String row) {
    List<String> token = row.split('');
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: token
            .map((e) => CalcButton(
                  keyvalue: e == '_' ? '+/-' : e == '<' ? '<=' : e,
                ))
            .toList(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalcState createState() => CalcState();
}

class CalcState extends State<Calculator> {
  String inputString = '';
  double prevValue;
  String value = '';
  String op = 'z';

  bool isNumber(String str) {
    if (str == null) {
      return false;
    }
    return double.parse(str, (e) => null) != null;
  }

  void onPressed(keyvalue) {
    switch (keyvalue) {
      case 'C':
        op = null;
        prevValue = 0.0;
        value = '';
        setState(() => inputString = '');
        break;
      case '.':
      case '%':
      case '<=':
      case '+/-':
        break;
      case 'x':
      case '+':
      case '-':
      case '/':
        op = keyvalue;
        value = '';
        prevValue = double.parse(inputString);
        setState(() {
          inputString = inputString + keyvalue;
        });
        break;
      case '=':
        if (op != null) {
          setState(() {
            switch (op) {
              case 'x':
                inputString =
                    (prevValue * double.parse(value)).toStringAsFixed(0);
                break;
              case '+':
                inputString =
                    (prevValue + double.parse(value)).toStringAsFixed(0);
                break;
              case '-':
                inputString =
                    (prevValue - double.parse(value)).toStringAsFixed(0);
                break;
              case '/':
                inputString =
                    (prevValue / double.parse(value)).toStringAsFixed(2);
                break;
            }
          });
          op = null;
          prevValue = double.parse(inputString);
          value = '';
          break;
        }
        break;
      default:
        if (isNumber(keyvalue)) {
          if (op != null) {
            setState(() => inputString = inputString + keyvalue);
            value = value + keyvalue;
          } else {
            setState(() => inputString = '' + keyvalue);
            op = 'z';
          }
        } else {
          onPressed(keyvalue);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainState(
      inputValue: inputString,
      prevValue: prevValue,
      value: value,
      op: op,
      onPressed: onPressed,
      child: CalculatorLayout(),
    );
  }
}

class MainState extends InheritedWidget {
  MainState({
    Key key,
    this.inputValue,
    this.prevValue,
    this.value,
    this.op,
    this.onPressed,
    Widget child,
  }) : super(key: key, child: child);

  final String inputValue;
  final double prevValue;
  final String value;
  final String op;
  final Function onPressed;

  static MainState of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MainState);
  }

  @override
  bool updateShouldNotify(MainState oldWidget) {
    return inputValue != oldWidget.inputValue;
  }
}

class CalcButton extends StatelessWidget {
  CalcButton({this.keyvalue});

  final String keyvalue;

  @override
  Widget build(BuildContext context) {
    final mainState = MainState.of(context);
    return Expanded(
      flex: 1,
      child: FlatButton(
        shape: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2.0,
          style: BorderStyle.solid,
        ),
        color: Colors.white,
        child: Text(
          keyvalue,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 36.0,
            color: Colors.black54,
            fontStyle: FontStyle.normal,
          ),
        ),
        onPressed: () {
          mainState.onPressed(keyvalue);
        },
      ),
    );
  }
}
