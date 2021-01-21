import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netflex_clone/screens/main_screen.dart';

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
    return MainScreen(flatButtonStyle: flatButtonStyle);
  }
}
