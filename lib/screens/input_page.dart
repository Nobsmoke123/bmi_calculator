import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Custom Widgets
import '../components/custom_card.dart';
import '../components/icon_list.dart';
import '../components/my_slider.dart';
import '../constants.dart';
import '../components/round_button.dart';
import '../components/bottom_button.dart';
import 'result_page.dart';
import '../calculator_brain.dart';

enum Gender {
    male,
    female
}

class InputPage extends StatefulWidget {
    @override
    _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
    // Stores the selected Gender
    Gender selectedGender;
    int weight = 40;
    int age = 25;
    int height = 150;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('BMI CALCULATOR'),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  Expanded(
                      child: Row(
                          children: <Widget>[
                              Expanded(
                                child: CustomCard(
                                    colour: selectedGender == Gender.male ? kActiveCardColor : kInActiveCardColor,
                                    onPress: (){
                                        setState(() {
                                            selectedGender = Gender.male;
                                        });
                                    },
                                    cardChild: IconList(
                                        icon: FontAwesomeIcons.mars,
                                        label: 'MALE',
                                    ),
                                ),
                              ),
                              Expanded(
                                child: CustomCard(
                                    onPress: (){
                                        setState(() {
                                            selectedGender = Gender.female;
                                        });
                                    },
                                    colour: selectedGender == Gender.female ? kActiveCardColor : kInActiveCardColor,
                                    cardChild: IconList(
                                        icon: FontAwesomeIcons.venus,
                                        label: 'FEMALE'
                                    ),
                                ),
                              ),
                          ],
                      ),
                  ),
                  Expanded(
                      child: CustomCard(
                          colour: kActiveCardColor,
                          cardChild: MySlider(height: height,onChanged: (double value){
                              setState(() {
                                  height = value.toInt();
                              });
                          },),
                      ),
                  ),
                  Expanded(
                      child: Row(
                          children: <Widget>[
                              Expanded(
                                  child: CustomCard(
                                      colour: kActiveCardColor,
                                      cardChild: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                              Text(
                                                'WEIGHT',
                                                style: kLabelTextStyle,
                                              ),
                                              Text(
                                                  weight.toString(),
                                                  style: kNumberTextStyle,
                                              ),
                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                    RoundIconButton(
                                                        icon: FontAwesomeIcons.minus,
                                                        onPressed: (){
                                                            setState(() {
                                                              weight--;
                                                            });
                                                        },
                                                    ),
                                                    SizedBox(
                                                        width: 10.0,
                                                    ),
                                                    RoundIconButton(
                                                        icon: FontAwesomeIcons.plus,
                                                        onPressed: (){
                                                            setState(() {
                                                              weight++;
                                                            });
                                                        },
                                                    ),
                                                ],
                                              ),
                                          ],
                                      ),
                                  ),
                              ),
                              Expanded(
                                  child: CustomCard(
                                      colour: kActiveCardColor,
                                      cardChild: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                              Text(
                                                  'AGE',
                                                  style: kLabelTextStyle,
                                              ),
                                              Text(
                                                  age.toString(),
                                                  style: kNumberTextStyle,
                                              ),
                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                      RoundIconButton(
                                                          icon: FontAwesomeIcons.minus,
                                                          onPressed: (){
                                                              setState(() {
                                                                  age--;
                                                              });
                                                          },
                                                      ),
                                                      SizedBox(
                                                          width: 10.0,
                                                      ),
                                                      RoundIconButton(
                                                          icon: FontAwesomeIcons.plus,
                                                          onPressed: (){
                                                              setState(() {
                                                                  age++;
                                                              });
                                                          },
                                                      ),
                                                  ],
                                              ),
                                          ],
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ),
                  BottomButton(
                      onTap: (){
                          CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ResultsPage(
                                  bmiResult: calc.calculateBMI(),
                                  interpretation: calc.getMessage(),
                                  resultText: calc.getResult(),
                              ))
                          );
                      },
                      label: 'CALCULATE',
                  ),
              ],
            ),
        );
    }
}

