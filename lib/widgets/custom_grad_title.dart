import 'package:flutter/material.dart';
import 'package:jit_debate/constents/colors.dart';

class CustomGradTitle extends StatelessWidget {
  final String title;
  final double fntSize;
  final Shader linearGradient = LinearGradient(
    colors: <Color>[grdntColor2, grdntColor1],
  ).createShader(Rect.fromLTWH(0.0, 20.0, 580.0, 70.0));
  CustomGradTitle({
    required this.title,
    required this.fntSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Cubano',
          fontSize: fntSize,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = linearGradient),
    );
  }
}
