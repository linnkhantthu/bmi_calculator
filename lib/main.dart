import 'package:flutter/material.dart';

import 'MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Color backgroundColor = Color(0xff03061C);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor
      ),
      home: MainScreen(),
    );
  }
}
