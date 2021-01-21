import 'package:flutter/material.dart';
import 'package:netflex_clone/const.dart';

class topBarContainer extends StatelessWidget {
  final String title;
  topBarContainer({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 1),
      child: Text(title, style: kTopBarContainerTextStyle),
    );
  }
}
