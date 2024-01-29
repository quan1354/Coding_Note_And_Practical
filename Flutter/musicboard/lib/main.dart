import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> playSound(int num) async {
    final player = AudioPlayer();
    await player.play(AssetSource('./note$num.wav'));
  }

  Expanded buildKey({Color color=Colors.white, int sound=1}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.zero, // This removes the rounded corners
            ),
          ),
        ),
        onPressed: () async {
          playSound(sound);
        },
        child: const Text(''),
      ),
    );
  }

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(color:Colors.red, sound:1),
            buildKey(color:Colors.orange, sound:2),
            buildKey(color:Colors.yellow, sound:3),
            buildKey(color:Colors.teal, sound:4),
            buildKey(color:const Color.fromARGB(255, 3, 8, 255), sound:5),
            buildKey(color:const Color.fromARGB(255, 0, 174, 255), sound:6),
            buildKey(color:const Color.fromARGB(255, 153, 0, 255), sound:7),
          ],
        )),
      ),
    );
  }
}
