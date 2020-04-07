import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){

    for(int i=0; i <= 10; i++){

      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Lorem ipsum dolor sit amet.";
      item["descricao"] = "Descrição ${i} Lorem ipsum dolor sit amet.";

      _itens.add(item);

    }

  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
        appBar: AppBar(
          title: Text("Lista"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {

              // Map<String, dynamic> item = _itens[indice];
              // print("Item ${_itens[indice]["titulo"]}");

              return ListTile(
                onTap: () {
                  //print("Clique com onTap ${indice}");
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(_itens[indice]["titulo"]),
                        titlePadding: EdgeInsets.all(20),
                        titleTextStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.orange
                        ),
                        content: Text(_itens[indice]["descricao"]),
                        backgroundColor: Colors.white,
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              print("Selecionado SIM");
                              Navigator.pop(context);
                            },
                            child: Text("Sim")
                          ),
                          FlatButton(
                            onPressed: () {
                              print("Selecionado NÃO");
                              Navigator.pop(context);
                            },
                            child: Text("Não")
                          ),
                        ],
                      );
                    }
                  );
                },
                /*
                onLongPress: () {
                  print("Clique com onLongTap");
                },*/
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            },
          ),
        ));
  }
}
