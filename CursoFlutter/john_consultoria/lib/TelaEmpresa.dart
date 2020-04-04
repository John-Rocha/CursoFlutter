import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("imagens/detalhe_empresa.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Sobre a empresa",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempus placerat cursus. Nunc interdum vitae risus quis placerat. Curabitur quis tellus erat. Nunc ut velit et sem interdum mattis quis ut massa. Proin interdum ante dolor, quis ullamcorper elit tempus at. Integer quis sapien ipsum. Suspendisse vel libero finibus, sodales massa et, iaculis nunc. Donec at leo sed sapien volutpat euismod vel sit amet dui. Morbi rhoncus erat et mi iaculis, id congue nisl ullamcorper. Duis eget interdum sapien, non rhoncus magna. Quisque consectetur turpis non ex porttitor condimentum non eget lacus. Nulla dictum est id rhoncus tincidunt. Suspendisse efficitur est in vehicula pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempus placerat cursus. Nunc interdum vitae risus quis placerat. Curabitur quis tellus erat. Nunc ut velit et sem interdum mattis quis ut massa. Proin interdum ante dolor, quis ullamcorper elit tempus at. Integer quis sapien ipsum. Suspendisse vel libero finibus, sodales massa et, iaculis nunc. Donec at leo sed sapien volutpat euismod vel sit amet dui. Morbi rhoncus erat et mi iaculis, id congue nisl ullamcorper. Duis eget interdum sapien, non rhoncus magna. Quisque consectetur turpis non ex porttitor condimentum non eget lacus. Nulla dictum est id rhoncus tincidunt. Suspendisse efficitur est in vehicula pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempus placerat cursus. Nunc interdum vitae risus quis placerat. Curabitur quis tellus erat. Nunc ut velit et sem interdum mattis quis ut massa. Proin interdum ante dolor, quis ullamcorper elit tempus at. Integer quis sapien ipsum. Suspendisse vel libero finibus, sodales massa et, iaculis nunc. Donec at leo sed sapien volutpat euismod vel sit amet dui. Morbi rhoncus erat et mi iaculis, id congue nisl ullamcorper. Duis eget interdum sapien, non rhoncus magna. Quisque consectetur turpis non ex porttitor condimentum non eget lacus. Nulla dictum est id rhoncus tincidunt. Suspendisse efficitur est in vehicula pretium.",
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}