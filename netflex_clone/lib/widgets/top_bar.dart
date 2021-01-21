import 'package:flutter/material.dart';
import 'package:netflex_clone/widgets/top_bar_container.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 30,
          ),
          topBarContainer(title: 'TV 프로그램'),
          topBarContainer(title: '영화'),
          topBarContainer(title: '드라마'),
        ],
      ),
    );
  }
}
