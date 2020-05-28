import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

  double pixelRatio = MediaQuery.of(context).devicePixelRatio;

  print("pixel ratio: " + pixelRatio.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Imagens"),
      ),
      body: Container(
        child: Image.asset("assets/icone.png")
      ),
    );
  }
}
