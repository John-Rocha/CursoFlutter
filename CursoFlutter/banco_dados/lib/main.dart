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
      // "nome" : "John Rocha",
      // "idade" : 33,
      // "nome" : "Anne Guimarães",
      // "idade" : 25,
      // "nome" : "Maria Rocha",
      // "idade" : 53,
      // "nome" : "João Almeida",
      // "idade" : 59,
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

  _listarUsuarioPeloId(int id) async {

    //recupera o banco
    Database bd = await _recuperarBancoDados();

    List usuarios = await bd.query(
      "usuarios",
      columns: ["id", "nome", "idade"],
      where: "id = ?",
      whereArgs: [id]
    );

      for (var usuario in usuarios) {
        print(usuario);
      }
  }

  _excluirUsuario(int id) async {

    Database bd = await _recuperarBancoDados();

    int  retorno = await bd.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );

    print("Item quantidade removida: $retorno");
  }

  _atualizarUsuario(int id) async {

    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome" : "John Rocha",
      "idade" : 32
    };

    int retorno = await bd.update(
      "usuarios",
      dadosUsuario,
      where: "id=?",
      whereArgs: [id]
    );

    //print("Item quantidade removida: $retorno");
  }


  @override
  void initState() {
    super.initState();
    //_salvar();
    //_excluirUsuario(5);
    _listarUsuarios();
    //_recuperarBancoDados();
    //_atualizarUsuario(8);
    //_listarUsuarioPeloId(8);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
