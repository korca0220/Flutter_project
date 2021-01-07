import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reuseable_card.dart';

const double bottomContainerHeight = 80.0;

const ActiveCardColor = Color(0xFF1D1E33);
const inactivateCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFeB1555);

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactivateCardColor;
  Color femaleCardColor = inactivateCardColor;

  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.Male) {
      if (maleCardColor == inactivateCardColor) {
        maleCardColor = ActiveCardColor;
        femaleCardColor = inactivateCardColor;
      } else {
        maleCardColor = inactivateCardColor;
      }
    }
    if (selectedGender == Gender.Female) {
      if (femaleCardColor == inactivateCardColor) {
        femaleCardColor = ActiveCardColor;
        maleCardColor = inactivateCardColor;
      } else {
        femaleCardColor = inactivateCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.Male);
                      });
                    },
                    child: ReuseableCard(
                      colour: maleCardColor,
                      cardChild: ReuseableColumn(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.Female);
                      });
                    },
                    child: ReuseableCard(
                      colour: femaleCardColor,
                      cardChild: ReuseableColumn(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: ActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    colour: ActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: ActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
