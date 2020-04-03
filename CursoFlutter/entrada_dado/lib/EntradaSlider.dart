import 'dart:math';

import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double valor = 5;
  String label = "Valor selecionado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Slider"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(40)),
            Slider(
              label: label,
              divisions: 10,
              activeColor: Colors.red,
              inactiveColor: Colors.purple,
              value: valor,
              min: 0,
              max: 10,
              onChanged: (double novoValor){
                setState(() {
                  valor = novoValor;
                  label = "Valor selecionado: " + novoValor.toString();
                  print("Valor selecionado: " + novoValor.toString());
                });
              }
            ),
            RaisedButton(
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              onPressed: () {

              }
            )
          ],
        ),
      ),
    );
  }
}