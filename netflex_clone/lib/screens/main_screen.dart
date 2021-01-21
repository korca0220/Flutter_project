import 'package:flutter/material.dart';
import 'package:netflex_clone/screens/home_screen.dart';
import 'package:netflex_clone/screens/search_screen.dart';
import 'package:netflex_clone/screens/liked_screen.dart';
import 'package:netflex_clone/screens/profile_screen.dart';

import 'package:netflex_clone/widgets/bottom_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key key,
    @required this.flatButtonStyle,
  }) : super(key: key);

  final ButtonStyle flatButtonStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(style: flatButtonStyle),
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(),
                SearchScreen(),
                LikeScreen(),
                ProfileScreen()
              ],
            ),
            bottomNavigationBar: BottomBar(),
          ),
        ),
      ),
    );
  }
}
