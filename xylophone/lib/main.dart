import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(String audio) {
    final player = AudioCache();
    player.play('$audio');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  playSound('note1.wav');
                },
                color: Colors.red,
              ),
              FlatButton(
                  onPressed: () {
                    playSound('note2.wav');
                  },
                  color: Colors.orange),
              FlatButton(
                  onPressed: () {
                    playSound('note3.wav');
                  },
                  color: Colors.yellow),
              FlatButton(
                  onPressed: () {
                    playSound('note4.wav');
                  },
                  color: Colors.green),
              FlatButton(
                  onPressed: () {
                    playSound('note5.wav');
                  },
                  color: Colors.teal),
              FlatButton(
                  onPressed: () {
                    playSound('note6.wav');
                  },
                  color: Colors.blue),
              FlatButton(
                  onPressed: () {
                    playSound('note7.wav');
                  },
                  color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
