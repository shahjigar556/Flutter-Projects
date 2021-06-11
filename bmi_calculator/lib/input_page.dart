import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Round_icon_button.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI calculator'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(FontAwesomeIcons.mars, 'Male'),
                      onTap: () {
                        print('Male Card Pressed');
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }),
                ),
                Expanded(
                  child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(FontAwesomeIcons.venus, 'Female'),
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      }),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        color: kInactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Height', style: kLabelTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newVal) {
                                  setState(() {
                                    height = newVal.round();
                                  });
                                  //print(height);
                                })
                          ],
                        )))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  color: kInactiveCardColour,
                  cardChild: Column(
                    children: [
                      Text('Weight', style: kLabelTextStyle),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  color: kInactiveCardColour,
                  cardChild: Column(
                    children: [
                      Text('Age', style: kLabelTextStyle),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          BottomButton(
            buttonText:'Calculate',
            onTap:() {
              CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
              )));
            }
          )
          ],
        ));
  }
}
