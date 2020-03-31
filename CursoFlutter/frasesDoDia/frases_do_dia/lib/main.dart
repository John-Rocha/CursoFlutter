import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "Só é corno quem namora.",
    "Curioso só se fode.",
    "Pode ser, mas cada um paga o seu consumo. 2019 ainda bem que não virei pai!",
    "Ela tá dando pra outro",
    "Amor é uma merda",
    "Tá aqui, mas tá mole.",
    "Ê carai, vem pra cá, na moral tá muito TOP!!!!",
    "Comendo cu de curioso.",
    "Manda a palhinha!",
    "Boa tarde alguém sabe me informa se a unu e bipolar?",
    "Faz o surveti aí!",
    "Apaga o longuinho",
    "Não te dou esse tipo de ousadia",
    "Mamatsu no papai",
    "Só no mamante",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma nova frase!";

  void _gerarFrase() {

    var numeroSorteado = Random().nextInt(_frases.length);
    
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Container(
        padding: EdgeInsets.all(16),
        //width: double.infinity,
        /*decoration: BoxDecoration(
          border: Border.all(width: 3,color: Colors.deepOrangeAccent),
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Text(
              "$_fraseGerada",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ),
            ),
            RaisedButton(
              child: Text(
                "Nova Frase",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              color: Colors.green,
              onPressed: _gerarFrase,
            )
          ],
        ),
      ),
    ),
  );
}
}