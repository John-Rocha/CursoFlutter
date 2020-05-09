import 'package:flutter/material.dart';
import 'package:whatsapp/model/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _emailUsuario = "";

  @override
  void initState() {

    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseUser usuarioLogado = await auth.currentUser();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
      ),
      body: Center(
        child: Text(_emailUsuario),
      ),
    );
  }
}