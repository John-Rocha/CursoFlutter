import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  List _listaTarefas = [];

  Future<File> _getFile() async {
    //Monta o path(diretorio) no qual os dados serão armazenados
    final diretorio = await getApplicationDocumentsDirectory();
    //Cria o arquivo (no formato JSON) na raiz do diretório
    return File("${diretorio.path}/dados.json");
  }

  _salvarArquivo() async {

    //Recupera o arquivo
    var arquivo = await _getFile();

    //Criar dados em um Map
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = "Trabalhar";
    tarefa["realizada"] = false;
    _listaTarefas.add(tarefa);

    //conversão da lista em um objeto json
    String dados = json.encode(_listaTarefas);
    //salva os dados no formato que o método for invocado
    arquivo.writeAsString(dados);

  }

  _lerArquivo() async {

    try {

      final arquivo = await _getFile();
      return arquivo.readAsString();

    } catch (e) {

      return null;

    }

  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados){
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    print("items: " + _listaTarefas.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Adicionar tarefa"),
                  content: TextField(
                    decoration: InputDecoration(
                      labelText: "Digite sua tarefa",
                    ),
                    onChanged: (text) {},
                  ),
                  actions: <Widget>[
                    FlatButton(
                        child: Text("Cancelar"),
                        onPressed: () => Navigator.pop(context)),
                    FlatButton(
                      child: Text("Salvar"),
                      onPressed: () {
                        _salvarArquivo();
                      },
                    )
                  ],
                );
              });
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_listaTarefas[index]['titulo']),
                  );
                }),
          )
        ],
      ),
    );
  }
}
