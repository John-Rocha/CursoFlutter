import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDados() async {

    //Recupera o caminho que vai ficar guardado o arquivo do banco
    final caminhoBancoDados =  await getDatabasesPath();

    //Cria o arquivo do banco e da nome a ele (banco.db)
    final localBancoDados = join(caminhoBancoDados, "banco.db");
    
    //Método que recupera a instancia do banco
    var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente) {

        //Gera os comandos para inserção da tabela no banco
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";

        db.execute(sql);
      }
    );

    return bd;

    // print("Caminho path: " + localBancoDados);
    // print("Aberto: " + bd.isOpen.toString());
  }

  //Método que salvará as informações no banco
  _salvar() async {

    //Recupera o banco e é através dele que fazemos qualquer alteração
    Database bd = await _recuperarBancoDados();
    
    Map<String, dynamic> dadosUsuario = {
      "nome" : "Anne Thais",
      "idade" : 25
    };
    int id = await bd.insert("usuarios", dadosUsuario);

    print("Salvo: $id");

  }

  _listarUsuarios() async {

    //recupera o banco
    Database bd = await _recuperarBancoDados();

    //Coloca o select dentro de uma variárel
    String sql = " SELECT * FROM usuarios ";
    
    //Agrega os dados da tabela através de um List
    List usuarios = await bd.rawQuery(sql);

    for (var usuario in usuarios) {
      print(usuario);
    }

    //print("Usuários: " +usuarios.toString());

  }

  @override
  Widget build(BuildContext context) {
    _listarUsuarios();
    _salvar();
    _recuperarBancoDados();
    return Container(
      
    );
  }
}
