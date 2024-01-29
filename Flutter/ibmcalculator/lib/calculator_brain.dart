// ignore_for_file: prefer_final_fields

import 'dart:math';

class CalculatorBrain{
  CalculatorBrain(this.height, this.weight);
  final int height;
  final int weight;
  double _bmi = 0;
  
  String calculateBMI(){
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25){
      return 'Overweight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if (_bmi >= 25){
      return 'You must do more Exercise';
    }else if(_bmi > 18.5){
      return 'Good Job !';
    }else{
      return 'You must eat more foods';
    }
  }
}