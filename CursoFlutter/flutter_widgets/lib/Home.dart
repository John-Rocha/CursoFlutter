import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List _lista = ["Johnathan", "Maria", "João", "Michele"];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _lista.length,
              itemBuilder: (context, index) {

                final item = (_lista[index]);

                return Dismissible(
                  //direction: DismissDirection.vertical,
                  background: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.edit, color: Colors.white)
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.delete, color: Colors.white)
                      ],
                    ),
                  ),
                  onDismissed: (direction){

                    if (direction == DismissDirection.endToStart) {
                      print("Direção: endToStart");
                    } else if (direction == DismissDirection.startToEnd) {
                      print("Direção: startToEnd");
                    }

                    setState(() {
                      _lista.removeAt(index);
                    });
                  },
                  key: Key(item),
                  child: ListTile(
                  title: Text(item), 
                  )
                );
              }
            )
          )
        ],
      ),
    );
  }
}