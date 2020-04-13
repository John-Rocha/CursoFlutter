import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("Resultado: pesquisa está sendo realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("Resultado: digitado " + query);

    List<String> lista = List();

    return Container();

    /*
    if(query.isNotEmpty) {
      lista = [
        "WordPress", "GitHub", "Raspberry"
      ].where(
        (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(lista[index]),
          onTap: () => close(context, lista[index]),
        );
        }
      );

    } else {
      return Center(
        child: Text("Nenhum resultado para pesquisa"),
      );
    }
    */
  }

}