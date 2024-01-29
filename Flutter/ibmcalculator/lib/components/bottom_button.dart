
import 'package:flutter/material.dart';
import 'package:ibmcalculator/constant.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback function;
  BottomButton(this.title, this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: kLargeButtonTextStyle,
        )),
        padding: EdgeInsets.only(bottom: 10.0),
        color: KBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KBottomContainerHeight,
      ),
    );
  }
}