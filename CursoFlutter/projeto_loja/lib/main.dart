import 'package:flutter/material.dart';
import 'package:projeto_loja/home.dart';
import 'package:projeto_loja/pages/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "App Loja",
    home: SplashScreen(),
  ));
}