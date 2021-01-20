import 'package:flutter/material.dart';
import 'package:netflex_clone/screens/home_screen.dart';
import 'package:netflex_clone/screens/profile_screen.dart';
import 'package:netflex_clone/screens/search_screen.dart';
import 'package:netflex_clone/widgets/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController controller;

  final ButtonStyle flatButtonStyle =
      ElevatedButton.styleFrom(primary: Colors.red);

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
                Container(
                  child: Center(child: Text('Save')),
                ),
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
