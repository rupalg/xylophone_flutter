import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource('note$soundNumber.wav'),
    );
  }

  Expanded buildKey(
      {required int keyNumber,
      required Color keyColor,
      required String keyNote}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(keyColor),
        ),
        onPressed: () async {
          playSound(keyNumber);
        },
        child: Text(keyNote),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(
                keyNumber: 1,
                keyColor: Colors.lightBlueAccent,
                keyNote: 'Sa',
              ),
              buildKey(keyNumber: 2, keyColor: Colors.lightBlue, keyNote: 'Re'),
              buildKey(
                  keyNumber: 3, keyColor: Colors.blueAccent, keyNote: 'Ga'),
              buildKey(keyNumber: 4, keyColor: Colors.blueGrey, keyNote: 'Ma'),
              buildKey(keyNumber: 5, keyColor: Colors.grey, keyNote: 'Pa'),
              buildKey(keyNumber: 6, keyColor: Colors.black26, keyNote: 'Dha'),
              buildKey(keyNumber: 6, keyColor: Colors.black, keyNote: 'Ni'),
            ],
          ),
        ),
      ),
    );
  }
}
