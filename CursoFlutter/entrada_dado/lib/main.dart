import 'package:flutter/material.dart';
import 'CampoTexto.dart';
import 'EndradaSwitch.dart';
import 'EntradaCheckbox.dart';
import 'EntradaRadioButton.dart';
import 'EntradaSlider.dart';

void main(){
  runApp(
    MaterialApp(
      //home: CampoTexto(),
      //home: EntradaCheckbox(),
      //home: EntradaRadioButton(),
      //home: EntradaSwitch(),
      home: EntradaSlider(),
      debugShowCheckedModeBanner: false,
    )
  );
}

