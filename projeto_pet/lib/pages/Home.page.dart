import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            width: 100,
            child: Image.asset("images/app-logo.png"),
          ),
        ),
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/user-picture.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            width: 60,
            child: FlatButton(
              child: Icon(
                Icons.search,
                color: Color(0xFFBABABA),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF2FF3F6),
        child: ListView(
          children: <Widget>[
            cardItem(),
            cardItem(),
            cardItem(),
          ],
        ),
      ),
    );
  }
}

Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://www.petz.com.br/blog/wp-content/uploads/2019/06/vacinacao-para-caes.jpg"),
          ),
          title: Text("John Rocha"),
          subtitle: Text("13/10/1987 11:45"),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          child: Image.asset("images/post-picture-001.png"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          child: Text(
            "Animais são muito legais, principalmente os cães. Eles são considerados os melhores amigos dos homens e extremamente fieis a eles.",
            textAlign: TextAlign.justify,
          ),
        ),
        ButtonTheme(
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.favorite),
                onPressed: () {},
              ),
              FlatButton(
                child: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    ),
  );
}