import 'package:flutter/material.dart';
import 'package:projeto_loja/pages/ContatosPage.dart';
import 'package:projeto_loja/pages/ProdutosPage.dart';
import 'package:projeto_loja/pages/PromocoesPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3, 
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Loja"),
        backgroundColor: Colors.red,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Produtos",
              //icon: Icon(Icons.build),
            ),
            Tab(
              text: "Promoções",
              //icon: Icon(Icons.attach_money),
            ),
            Tab(
              text: "Contatos",
              //icon: Icon(Icons.contacts),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ProdutosPage(),
          PromocoesPage(),
          ContatosPage()
        ],
      ),
    );
  }
}