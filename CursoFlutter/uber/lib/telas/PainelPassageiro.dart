import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PainelPassageiro extends StatefulWidget {
  @override
  _PainelPassageiroState createState() => _PainelPassageiroState();
}

class _PainelPassageiroState extends State<PainelPassageiro> {

  List<String> itensMenu = ["Configuração", "Deslogar"];

  _deslogarUsuario() async {

    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/");

  }

  _escolhaItemMenu(String escolha) {

    switch (escolha) {
      case "Deslogar":
        _deslogarUsuario();  
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painel passageiro"),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _escolhaItemMenu,
            itemBuilder: (context) => itensMenu.map(
              (String item) => PopupMenuItem<String>(
                value: item,
                child: Text(item),
              ),
            ).toList(),
          ),
        ],
      ),
      body: Container(
        
      ),
    );
  }
}