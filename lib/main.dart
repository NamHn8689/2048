import 'package:flutter/material.dart';

import 'views/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2048 game',
      theme: ThemeData(
        fontFamily: "RobotoSlab",
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
