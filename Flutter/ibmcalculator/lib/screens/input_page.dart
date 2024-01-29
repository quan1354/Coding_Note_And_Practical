// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, sort_child_properties_last, use_key_in_widget_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibmcalculator/components/icon_content.dart';
import 'package:ibmcalculator/screens/results_page.dart';
import 'package:ibmcalculator/components/reusable_card.dart';
import 'package:ibmcalculator/constant.dart';
import 'package:ibmcalculator/components/round_button.dart';
import 'package:ibmcalculator/components/bottom_button.dart';
import 'package:ibmcalculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 10;
  // Color maleCardColour = inactiveCardColor;
  // Color femaleCardColour = inactiveCardColor;

  // void updateColour(Gender selectedGender){
  //   if(selectedGender == Gender.male){
  //     if(maleCardColour == inactiveCardColor){
  //       maleCardColour = activeWorkColor;
  //       femaleCardColour = inactiveCardColor;
  //     }else{
  //       maleCardColour = inactiveCardColor;
  //     }
  //   }
  //   if(selectedGender == Gender.female){
  //     if(femaleCardColour == inactiveCardColor){
  //       femaleCardColour = activeWorkColor;
  //       maleCardColour = inactiveCardColor;
  //     }else{
  //       femaleCardColour = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.male
                        ? KActiveWorkColor
                        : KInactiveCardColor,
                    IconContent(FontAwesomeIcons.mars, 'MALE'),
                    () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      selectedGender == Gender.female
                          ? KActiveWorkColor
                          : KInactiveCardColor,
                      IconContent(FontAwesomeIcons.venus, 'FEMALE'), () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  }),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                  KActiveWorkColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: KLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: kNumberTextStyle),
                          Text('CM', style: KLabelTextStyle),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            }),
                      )
                    ],
                  ),
                  () {}),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      KActiveWorkColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: KLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                SizedBox(width: 10.0),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              ]),
                        ],
                      ),
                      () {}),
                ),
                Expanded(
                  child: ReusableCard(
                      KActiveWorkColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: KLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                      () {}),
                ),
              ],
            )),
            BottomButton('CALCULATE', () {
              CalculatorBrain calculatorBrain =  CalculatorBrain(height, weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(calculatorBrain.calculateBMI(), calculatorBrain.getResult(), calculatorBrain.getInterpretation())));
            })
          ],
        ));
  }
}



