import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jit_debate/constents/colors.dart';
import 'package:jit_debate/widgets/custorm_gradient_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final Shader linearGradient = LinearGradient(
    colors: <Color>[grdntColor2, grdntColor1],
  ).createShader(Rect.fromLTWH(0.0, 20.0, 580.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Text(
                  'JIT-DEBATE',
                  style: TextStyle(
                      fontFamily: 'Cubano',
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 80, bottom: 20, left: 18, right: 18),
                child: Row(
                  children: [
                    Expanded(child: CustomGradientButton()),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(child: CustomGradientButton()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
