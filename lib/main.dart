import 'package:flutter/material.dart';

import 'UI/ClientScreens/AddClient.dart';
import 'UI/HomePage.dart';
import 'UI/StartScreens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
