import 'package:flutter/material.dart';
import 'package:ibmcalculator/constant.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.function);
  final IconData icon;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: function,
      child: Icon(icon),
    );
  }
}
