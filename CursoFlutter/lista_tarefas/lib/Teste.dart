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
  Map<String, dynamic> _ultimaTarefaRemovida = Map();
  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {

    //Monta o path(diretorio) no qual os dados serão armazenados
    final diretorio = await getApplicationDocumentsDirectory();
    //Cria o arquivo (no formato JSON) na raiz do diretório
    return File("${diretorio.path}/dados.json");

  }

  _salvarTarefa(){

    String textoDigitado = _controllerTarefa.text;

    //Criar dados em um Map
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;

    setState(() {
      _listaTarefas.add(tarefa);
    });
    
    _salvarArquivo();

    _controllerTarefa.text = "";

  }

  _salvarArquivo() async {

    //Recupera o arquivo
    var arquivo = await _getFile();

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

  Widget criarItemLista(context, index) {

    final item = _listaTarefas[index]["titulo"];
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {

        //recuperar o ultimo item excluído
        _ultimaTarefaRemovida = _listaTarefas[index];

        //Remover o item da lista
        _listaTarefas.removeAt(index);
        _salvarArquivo();

        //snackbar
        final snackbar = SnackBar(
          backgroundColor: Colors.grey,
          duration: Duration(seconds: 5),
          content: Text("Tarefa removida!!"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {

              //Insere novamente item removido da lista
              setState(() {
                _listaTarefas.insert(index, _ultimaTarefaRemovida);
              });              
              _salvarArquivo();

            }
          ),
        );

        Scaffold.of(context).showSnackBar(snackbar);

      },
      background: Container(
        color: Colors.redAccent,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white)
          ],
        ),
      ),
      child: CheckboxListTile(
      title: Text(_listaTarefas[index]['titulo']),
      value: _listaTarefas[index]['realizada'],
      onChanged: (valorAlterado) {
        setState(() {
          _listaTarefas[index]['realizada'] = valorAlterado;
        });
        _salvarArquivo();
      }
    )
    );
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

    //_salvarArquivo();
    //print("Itens: " + DateTime.now().millisecondsSinceEpoch.toString());

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
                    controller: _controllerTarefa,
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
                        _salvarTarefa();
                        Navigator.pop(context);
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
                itemBuilder: criarItemLista,
                ),
          )
        ],
      ),
    );
  }
}