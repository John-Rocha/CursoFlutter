import 'package:flutter/material.dart';
import 'Home.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color(0xff0066cc),      
    ),
    home: SplashScreen(),
  ));
}