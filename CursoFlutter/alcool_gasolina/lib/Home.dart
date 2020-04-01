/**
 * Utilizando campos de texto no APP
 */

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um valor",
              ),
              //enabled: false,
              //maxLength: 2,
              //maxLengthEnforced: false,
              // style: TextStyle(
              //   fontSize: 25,
              //   color: Colors.black,
              // ),
              //obscureText: true,
              // onChanged: (String texto){
              //   print("Valor digitado: " +texto);
              // },
              onSubmitted: (String texto){
                print("Valor digitado: " +texto);
              },
              controller: _textEditingController,
            ),
          ),
          RaisedButton(
            child: Text("Salvar"),
            color: Colors.lightGreen,
            onPressed: () {
              print("Valor digitado: " +_textEditingController.text);
            },
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey.shade200,
    );
  }
}