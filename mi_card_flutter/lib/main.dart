import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profile_image.jpg'),
            ),
            Text(
              'Unknown J',
              style: TextStyle(
                  height: 1.5,
                  fontFamily: 'Pacifico',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'Power Developer',
              style: TextStyle(
                  height: 0.8,
                  letterSpacing: 10,
                  fontFamily: 'SourceSansPro',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade100),
            )
          ],
        )),
      ),
    );
  }
}
