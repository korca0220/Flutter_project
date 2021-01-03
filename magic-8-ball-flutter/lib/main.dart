import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue[800],
        ),
        body: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int clickedImageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          changeClickedNumber();
        },
        child: Image.asset('images/ball$clickedImageNumber.png'),
      ),
    );
  }

  void changeClickedNumber() {
    setState(() {
      clickedImageNumber = Random().nextInt(5) + 1;
      print('$clickedImageNumber');
    });
  }
}
