import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return new MaterialApp(
      title: appTitle,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(appTitle),
        ),
        body: new MyForm(),
      ),
    );
  }
}

// Create a Form Widget
class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return new MyFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyFormState extends State<MyForm> {
  // Create a global key that will uniquely identify the `Form` widget
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return new Form(
      key: _formKey,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: new RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text('Processing Data')));
                }
              },
              child: new Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
