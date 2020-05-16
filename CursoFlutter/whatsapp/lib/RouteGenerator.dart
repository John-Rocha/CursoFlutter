import 'package:flutter/material.dart';
import 'package:whatsapp/Cadastro.dart';
import 'package:whatsapp/Configuracoes.dart';
import 'package:whatsapp/Home.dart';
import 'package:whatsapp/Login.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    switch(settings.name) {
      case "/" :
        return MaterialPageRoute(
          builder: (context) => Login()
      );
      case "/login" :
        return MaterialPageRoute(
          builder: (context) => Login()
      );
      case "/cadastro" :
        return MaterialPageRoute(
          builder: (context) => Cadastro()
      );
      case "/home" :
        return MaterialPageRoute(
          builder: (context) => Home()
      );
      case "/configuracoes" :
        return MaterialPageRoute(
          builder: (context) => Configuracoes()
      );
      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada"),
        ),
        body: Center(
          child: Text("Tela não encontrada"),
        ),
      )
    );
  }

}