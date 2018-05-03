import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MaterialApp(
      home: MyApp(),
      theme: ThemeData(
        canvasColor: Colors.indigo,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: Colors.deepOrange,
        brightness: Brightness.dark,
      ),
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController controller;
  num _seconds = 0;

  String get timerString {
    if (_seconds == 0) {
      return '0:00';
    } else {
      if (controller.value == 0.0) {
        return '${controller.duration.inMinutes}:${(controller.duration
            .inSeconds % 60)
            .toString()
            .padLeft(2, '0')}';
      }
      Duration duration = controller.duration * controller.value;
      _seconds = duration.inSeconds;
      return '${duration.inMinutes}:${(duration.inSeconds % 60)
          .toString()
          .padLeft(2, '0')}';
    }
  }

  _onPlayPausePressed() {
    if (controller.isAnimating) {
      controller.stop();
      setState(() {});
    } else {
      if (_seconds != 0) {
        controller.reverse(
            from: controller.value == 0.0 ? 1.0 : controller.value);
      }
    }
  }

  void _onAddRemovePressed(bool isAdd) {
    if (!controller.isAnimating) {
      print(_seconds);
      _seconds = isAdd ? _seconds + 30 : _seconds - 30;
      setState(() {
        controller.duration = Duration(seconds: _seconds);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    FloatingActionButton playPauseButton = FloatingActionButton(
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return new Icon(
              controller.isAnimating ? Icons.pause : Icons.play_arrow);
        },
      ),
      onPressed: _onPlayPausePressed,
    );

    FloatingActionButton addButton = FloatingActionButton(
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return new Icon(Icons.add);
        },
      ),
      onPressed: () => _onAddRemovePressed(true),
    );
    FloatingActionButton removeButton = FloatingActionButton(
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return new Icon(Icons.remove);
        },
      ),
      onPressed: () => _onAddRemovePressed(false),
    );

    Text titleText = Text(
      "Count Down",
      style: new TextStyle(fontFamily: 'woff', fontSize: 20.0),
    );

    var countDownText = AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return new Text(
            timerString,
            style: new TextStyle(fontFamily: 'woff', fontSize: 100.0),
          );
        });

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return new CustomPaint(
                              painter: TimerPainter(
                                animation: controller,
                                backgroundColor: Colors.white,
                                color: themeData.indicatorColor,
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            titleText,
                            countDownText,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  playPauseButton,
                  addButton,
                  removeButton,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
