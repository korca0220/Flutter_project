import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(String audio) {
    final player = AudioCache();
    player.play('$audio');
  }

  Expanded buildKey({Color color, String audio}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(audio);
        },
        color: color,
      ),
    );
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
              buildKey(color: Colors.red, audio: 'note1.wav'),
              buildKey(color: Colors.orange, audio: 'note2.wav'),
              buildKey(color: Colors.yellow, audio: 'note3.wav'),
              buildKey(color: Colors.green, audio: 'note4.wav'),
              buildKey(color: Colors.teal, audio: 'note5.wav'),
              buildKey(color: Colors.blue, audio: 'note6.wav'),
              buildKey(color: Colors.purple, audio: 'note7.wav'),
            ],
          ),
        ),
      ),
    );
  }
}
