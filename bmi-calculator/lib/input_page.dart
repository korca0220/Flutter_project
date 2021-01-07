import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomContainerHeight = 80.0;

const int ActiveCardColor = 0xFF1D1E33;
const int bottomContainerColor = 0xFFeB1555;
const int awesomeIconColor = 0xFF8D8E98;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: ReuseableCard(
                    colour: Color(ActiveCardColor),
                    cardChild: ReuseableColumn(
                      colour: Color(awesomeIconColor),
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: Color(ActiveCardColor),
                    cardChild: ReuseableColumn(
                      colour: Color(awesomeIconColor),
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: Color(ActiveCardColor),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    colour: Color(ActiveCardColor),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: Color(ActiveCardColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(bottomContainerColor),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}

class ReuseableColumn extends StatelessWidget {
  ReuseableColumn(
      {@required this.colour, @required this.icon, @required this.label});

  final Color colour;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: colour,
          ),
        )
      ],
    );
  }
}

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}
