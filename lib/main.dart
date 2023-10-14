import 'package:assignment_10/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          actionsIconTheme: IconThemeData(
            color: Colors.blue
          )
        )
      ),
      home: HomeScreen(),
    );
  }
}
