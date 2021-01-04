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
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    playSound('note1.wav');
                  },
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      playSound('note2.wav');
                    },
                    color: Colors.orange),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      playSound('note3.wav');
                    },
                    color: Colors.yellow),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      playSound('note4.wav');
                    },
                    color: Colors.green),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      playSound('note5.wav');
                    },
                    color: Colors.teal),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      playSound('note6.wav');
                    },
                    color: Colors.blue),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      playSound('note7.wav');
                    },
                    color: Colors.purple),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
