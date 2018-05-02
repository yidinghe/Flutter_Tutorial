import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final List<String> images = [
  "images/wallpapers/wallpaper1.jpg",
  "images/wallpapers/wallpaper2.jpg",
  "images/wallpapers/wallpaper3.jpg",
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Demo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: DisplayPage(),
    );
  }
}

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => new _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  bool _isAddGradient = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _isAddGradient = !_isAddGradient;
          setState(() {
            _isAddGradient;
          });
        },
        tooltip: 'Switch Gradient Effect',
        child: Icon(Icons.all_inclusive),
      ),
      body: Center(
          child: SizedBox.fromSize(
        size: Size.fromHeight(550.0),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: GestureDetector(
                onTap: () {
                  String description;
                  switch (index) {
                    case 0:
                      description = '不摇碧莲，干翻苍穹';
                      break;
                    case 1:
                      description = '周五快到了，准备追更新';
                      break;
                    case 2:
                      description = '社会我宝姐，人美路子野';
                      break;
                  }
                  Scaffold.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.deepOrangeAccent,
                        duration: Duration(milliseconds: 800),
                        content: Center(
                          child: Text(
                            description,
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ),
                      ));
                },
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                      DecoratedBox(
                        decoration: _isAddGradient
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset.bottomRight,
                                  end: FractionalOffset.topLeft,
                                  colors: [
                                    Color(0x00000000).withOpacity(0.9),
                                    Color(0xff000000).withOpacity(0.01),
                                  ],
                                ),
                              )
                            : BoxDecoration(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
