// ignore_for_file: avoid_print, must_be_immutable
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text(
            'Dicee',
            style: TextStyle(color: Color.fromARGB(255, 47, 0, 255)),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 166, 0),
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void changeDicFace(maxNum) {
    setState(() {
      leftDiceNum = Random().nextInt(maxNum) + 1;
      rightDiceNum = Random().nextInt(maxNum) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
                onPressed: () {changeDicFace(6);},
                child: Image.asset('images/dice$leftDiceNum.png')),
          )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {changeDicFace(6);});
                  },
                  child: Image.asset('images/dice$rightDiceNum.png')),
            ),
          )
        ],
      ),
    );
  }
}
