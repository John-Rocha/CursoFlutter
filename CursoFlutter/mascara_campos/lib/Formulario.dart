import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/Validador.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _mensagem = "";
  String _nome;
  String _idade;
  String _cpf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[

                //Campos de Texto
                TextFormField(
                  controller: _nomeController,
                  onSaved: (newValue) => _nome = newValue,
                  decoration: InputDecoration(hintText: "Digite seu nome"),
                  validator: (value) {
                    return Validador()
                    .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                    .minLength(3, msg: "Mínimo de 3 caractéres para o nome!")
                    .maxLength(50, msg: "Máximo de 50 caractéres para o nome!")
                    .valido(value);
                  },
                ),

                TextFormField(
                  controller: _idadeController,
                  onSaved: (newValue) => _idade = newValue,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Digite sua idade"),
                  validator: (value) {
                    return Validador()
                    .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                    .valido(value);
                  },
                ),

                TextFormField(
                  controller: _cpfController,
                  onSaved: (newValue) => _cpf = newValue,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Digite seu CPF"),
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  validator: (value) {
                    return Validador().add(Validar.OBRIGATORIO, msg: "Campo obrigatório").add(Validar.CPF, msg: "CPF inválido").valido(value);
                  },
                ),

                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      setState(() {

                        /* _nome = _nomeController.text;
                        _idade = _nomeController.text;
                        _cpf = _nomeController.text; */

                        _mensagem = "Nome: ${_nome} idade: ${_idade} CPF: ${_cpf}";

                      });
                    }
                  },
                ),

                Text(
                  _mensagem,
                  style: TextStyle(fontSize: 25),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}