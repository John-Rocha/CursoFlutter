import 'package:flutter/material.dart';

class InputCustomizado extends StatelessWidget {

  final String hint;
  final bool obscure;
  final Icon icon;

  InputCustomizado({
    @required this.hint,
    this.obscure,
    this.icon
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: this.obscure,
        decoration: InputDecoration(
          icon: this.icon,
          border: InputBorder.none,
          hintText: this.hint,
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
        ),
      ),
    );
  }
}
