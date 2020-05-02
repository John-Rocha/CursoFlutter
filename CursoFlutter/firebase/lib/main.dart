import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

void main() async {

  WidgetsFlutterBinding.ensureInitialized ();

  Firestore db = Firestore.instance;

  /* 
  db.collection("usuarios")
    .document("003")
    .setData(
      {
        "nome": "Maria",
        "idade": "53"
      }
    );   
    */

  /* 
  Firestore db = Firestore.instance;

  DocumentSnapshot snapshot = await db.collection("usuarios").document("002").get();

  print("Dados: " + snapshot.data.toString());
  */  

  QuerySnapshot querySnapshot = await db
    .collection("usuarios")
    .getDocuments();

  //print("dados usuarios: " + querySnapshot.documents.toString());

  for (DocumentSnapshot item in querySnapshot.documents) {
    print("dados usuarios: " + item.);
  }

runApp(Home());
} 

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

/* class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  _recuperandoDados() async {

    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios").document("001").get();

    print("Dados: " + snapshot.data.toString());

  }

  _deletandoDados() {
    Firestore db = Firestore.instance;
    db.collection("usuarios").document("001").delete();
  }

  @override
  void initState() {
    super.initState();
    _recuperandoDados();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testando Firebase"),
      ),
      body: ListView.builder(
        
      ),
    );
  }
}
*/