import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimacaoTween extends StatefulWidget {
  @override
  _AnimacaoTweenState createState() => _AnimacaoTweenState();
}

class _AnimacaoTweenState extends State<AnimacaoTween> {

  static final colorTween = ColorTween(begin: Colors.white, end: Colors.orange);
  @override
  Widget build(BuildContext context) {
    return Center(
      /* child: TweenAnimationBuilder(
        duration: Duration(seconds: 2),
        tween: Tween<double>(begin: 0, end: 6.28),
        builder: (context, angulo, widget) {
          return Transform.rotate(
            angle: angulo,
            child: Image.asset("images/logo.png"),
          );
        },
      ), */
      
      /* child: TweenAnimationBuilder(
        duration: Duration(seconds: 2),
        tween: Tween<double>(begin: 50, end: 180),
        builder: (context, largura, widget) {
          return Container(
            color: Colors.green,
            width: largura,
            height: 60,
          );
        },
      ), */

      child: TweenAnimationBuilder(
        duration: Duration(seconds: 4),
        tween: colorTween,
        child: Image.asset("images/estrelas.jpg"),
        builder: (context, Color color, widget) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(color, BlendMode.overlay),
            child: widget,
          );
        },
      ),
    );
  }
}
