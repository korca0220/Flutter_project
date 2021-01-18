import 'package:flutter/material.dart';
import 'package:netflex_clone/screens/home_screen.dart';
import 'package:netflex_clone/widgets/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
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
                Container(
                  child: Center(child: Text('Search')),
                ),
                Container(
                  child: Center(child: Text('Save')),
                ),
                Container(
                  child: Center(child: Text('List')),
                )
              ],
            ),
            bottomNavigationBar: BottomBar(),
          ),
        ),
      ),
    );
  }
}
