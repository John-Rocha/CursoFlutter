import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projeto_pessoal/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: new ThemeData(
    brightness:Brightness.dark,
        primarySwatch: Colors.deepPurple,
        primaryColor: const Color(0xFF1bbabf),
        accentColor: const Color(0xFF64ffda),
        canvasColor: const Color(0xFF303030),
        fontFamily: 'Merriweather',
  ),
  home: Home(),
));

class Home extends StatefulWidget {

  var itens = new List<Item>();

  Home() {
    itens = [];
    // itens.add(Item(title: "Banana", done: false));
    // itens.add(Item(title: "Abacate", done: true));
    // itens.add(Item(title: "Laranja", done: false));
  }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var text = TextEditingController();

  void add() {
    if (text.text.isEmpty) {
      return;
    }
    setState(() {
      widget.itens.add(Item(title: text.text, done: false));
      text.text = "";
      save();
    });
  }

  void remove(int index) {
    widget.itens.removeAt(index);
    save();
  }

  Future load() async {
    var pref = await SharedPreferences.getInstance();
    var data = pref.getString('data');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((x){
        Item.fromJson(x);
      }).toList();
      setState(() {
        widget.itens = result;
      });
    }
  }

  save() async {
    var pref = await SharedPreferences.getInstance();
    await pref.setString('data', jsonEncode(widget.itens));
  }

  _HomeState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(
              color: Colors.white
            )
          ),
          controller: text,
        ),
      ),
      body: ListView.builder(
        //Quantidade de itens da lista
        itemCount: widget.itens.length,

        //Função que determina como eu vou construir essa lista para exibição precisa de dois parâmetros (BuildContext e o indice do array)
        itemBuilder: (context, index) {
          final item = widget.itens[index];
          return Dismissible(
            key: Key(item.title),
            child: CheckboxListTile(
            title: Text(item.title),
            value: item.done,
            onChanged: (valor) {
              setState(() {
                item.done = valor;
                save();
              });
            },
          ),
          onDismissed: (direction) {
            remove(index);
          },
          background: Container(
            color: Colors.red.withOpacity(0.2),
          ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF64ffda),
        onPressed: () => add(),
      ),
    );
  }
}