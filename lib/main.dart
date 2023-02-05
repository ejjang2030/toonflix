import 'package:flutter/material.dart';
import 'package:toonflix/constants/themes.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainThemeData,
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
