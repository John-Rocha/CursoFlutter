import 'package:flutter/material.dart';
import 'package:whatsapp/model/Conversa.dart';

class AbaConversas extends StatefulWidget {
  @override
  _AbaConversasState createState() => _AbaConversasState();
}

class _AbaConversasState extends State<AbaConversas> {

  List<Conversa> listaConversas = [
    Conversa(
      "Ana Clara",
      "Olá, tudo bem?",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-da40b.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=8229f2fa-ff58-4d48-9668-fc86a4511e4a"
    ),
    Conversa(
      "Pedro Silva",
      "Me manda o nome daquela série",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-da40b.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=7fce6458-f6f0-497f-ab68-5239fcf94195"
    ),
    Conversa(
      "Marcela Almeida",
      "Vamos sair hoje?",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-da40b.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=4c67a69c-bea0-4d60-a971-d029ccc61f48"
    ),
    Conversa(
      "José Renato",
      "O que tem para comer na sua casa?",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-da40b.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=e94d361b-d6b9-4b1a-aa1f-edafbf83dfd3"
    ),
    Conversa(
      "Jamilton Damasceno",
      "Tá gostando do curso?",
      "https://firebasestorage.googleapis.com/v0/b/whatsapp-da40b.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=cc33a1f3-f22c-4792-83b9-af17f51029a0"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaConversas.length,
      itemBuilder: (context, index) {

        Conversa conversa = listaConversas[index];

        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(conversa.caminhoFoto),
          ),
          title: Text(
            conversa.nome,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          subtitle: Text(
            conversa.mensagem,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14
            ),
          ),
        );
      }
    );
  }
}