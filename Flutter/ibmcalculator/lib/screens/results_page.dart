// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:ibmcalculator/components/reusable_card.dart';
import 'package:ibmcalculator/constant.dart';
import 'package:ibmcalculator/calculator_brain.dart';
import 'package:ibmcalculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultsPage(this.bmiResult, this.resultText, this.interpretation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: const Center(
                  child: Text('YOUR RESULT', style: kTitleTextStyle)),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                KActiveWorkColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText, style: kResultTextStyle),
                    Text(bmiResult, style: kBMITextStyle),
                    Text(interpretation, style: kBodyTextStyle),
                  ],
                ),
                () {}),
          ),
          BottomButton('BACK', () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
