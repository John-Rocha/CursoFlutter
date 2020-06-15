import 'package:flutter/material.dart';

class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.all(8),
            child: Image.asset("images/produto1.jpeg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.all(8),
            child: Image.asset("images/produto2.jpeg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.all(8),
            child: Image.asset("images/produto3.jpeg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.all(8),
            child: Image.asset("images/produto4.jpeg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.all(8),
            child: Image.asset("images/produto5.jpeg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.all(8),
            child: Image.asset("images/produto6.jpeg"),
          ),
        ),
      ],
    );
  }
}