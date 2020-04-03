import 'package:flutter/material.dart';
import 'CampoTexto.dart';
import 'EntradaCheckbox.dart';
import 'EntradaRadioButton.dart';

void main(){
  runApp(
    MaterialApp(
      //home: CampoTexto(),
      //home: EntradaCheckbox(),
      home: EntradaRadioButton(),
      debugShowCheckedModeBanner: false,
    )
  );
}

