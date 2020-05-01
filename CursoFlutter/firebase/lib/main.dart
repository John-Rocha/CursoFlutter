import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Firestore db = Firestore.instance;


  @override
  void initState() {
    super.initState();
    db.collection("noticias")
      .document("BNXYEMjGxGUxPhEQFkbv")
      .setData(
        {
          "titulo": "Flutter é legal",
          "descricao": "Segunda noticia!"
        }
      );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Testando Firebase"),
      ),
      body: Center(
        
      ),
    );
  }
}