import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _textoSalvo = "Nada salvo!";
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {

    //Pega o valor do campo digitado
    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);
    
    print("Operação (salvar): $valorDigitado");

  }

  _recuperar() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo = prefs.getString("nome") ?? "Sem valor!";
    });

    print("Operação (Recuperar): $_textoSalvo");

  }

  _remover() async {

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");

    print("Operação (remover)");


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              _textoSalvo,
              style: TextStyle(
                fontSize: 20
                ),
              ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                  onPressed: _salvar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Recuperar",
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                  onPressed: _recuperar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Remover",
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                  onPressed: _remover,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}