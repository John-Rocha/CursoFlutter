import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _moedaController = TextEditingController();

  String _valorRecuperado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Máscaras e Validações"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[


              //CPF
              TextField(
                controller: _cpfController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: "Digite o CPF"
                ),
              ),

              //CNPJ
              TextField(
                controller: _cnpjController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CnpjInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: "Digite o CNPJ"
                ),
              ),

              //CEP
              TextField(
                controller: _cepController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: "Digite o CEP"
                ),
              ),

              //Telefone
              TextField(
                controller: _telController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: "Digite o telefone"
                ),
              ),

              //Data
              TextField(
                controller: _dataController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: "Digite uma data"
                ),
              ),

               //Moeda
              TextField(
                controller: _moedaController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true),
                ],
                decoration: InputDecoration(
                  hintText: "Digite o valor"
                ),
              ),


              RaisedButton(
                child: Text("Recuperar valor"),
                onPressed: () {

                  setState(() {
                    //_valorRecuperado = _cpfController.text.toString();
                    //_valorRecuperado = _cnpjController.text.toString();
                    //_valorRecuperado = _cepController.text.toString();
                    //_valorRecuperado = _telController.text.toString();
                    //_valorRecuperado = _dataController.text.toString();
                    //_valorRecuperado = _moedaController.text.toString();

                    /* String moedaBD = _moedaController.text.toString();
                    moedaBD = moedaBD.replaceAll(".",  "");
                    moedaBD = moedaBD.replaceAll(",", ".");
                    
                    //_valorRecuperado = moedaBD;

                    double valorRecuperado = double.parse(moedaBD);
                    var formatador = NumberFormat("#,##0.00", "pt_BR");
                    var resultado = formatador.format(valorRecuperado);

                    _valorRecuperado = "BD: ${moedaBD} / Exibição: ${resultado}"; */

                    /* for (var item in Estados.listaEstados) {
                      print(item);
                    } */

                    /* for (var item in Meses.listaMeses) {
                      print(item);
                    } */

                    
                  });
                },
              ),

              Text(
                "Valor: ${_valorRecuperado}",
                style: TextStyle(
                  fontSize: 25
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}