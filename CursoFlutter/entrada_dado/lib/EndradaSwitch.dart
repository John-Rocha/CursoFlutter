import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Switch"),
        backgroundColor: Colors.black12,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text("Deseja receber notificações"),
              subtitle: Text("Receberá via e-mail"),
              activeColor: Colors.orange,
              value:  _escolhaUsuario,
              onChanged: (bool valor) {
                setState(() {
                  _escolhaUsuario = valor;
                });
              }
            ),

            RaisedButton(
              child: Text(
                "salvar",
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
              onPressed: () {
                if (_escolhaUsuario) {
                  print("Escolha: ATIVAR NOTIFICAÇÕES");
                } else {
                  print("Escolha: NÃO ATIVAR NOTIFICAÇÕES");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}