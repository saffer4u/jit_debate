import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jit_debate/constents/colors.dart';
import 'package:jit_debate/widgets/custorm_gradient_button.dart';
import 'package:jit_debate/widgets/participant_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[grdntColor2, grdntColor1],
  ).createShader(Rect.fromLTWH(0.0, 20.0, 580.0, 70.0));

  int? counterValue;

  Future<void> _getCount() async {
    FirebaseFirestore.instance.collection('approvedUser').get().then((value) {
      setState(() {
        counterValue = value.size;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _getCount();
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0.0),
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
                    Expanded(
                        child: CustomGradientButton(
                      onTap: () {
                        Navigator.of(context).pushNamed("regscreen");
                      },
                      imagePath: 'icons/plusicon.png',
                      btnTxt1: 'NEW',
                      btnTxt2: "Registration",
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: CustomGradientButton(
                      onTap: () {
                        Navigator.of(context).pushNamed('loginscreen');
                      },
                      imagePath: 'icons/adminicon.png',
                      btnTxt1: 'ADMIN',
                      btnTxt2: 'PANEL',
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: ParticipantButton(
                  onTap: () {
                    Navigator.of(context).pushNamed('allapproval');
                  },
                  btnTxt1: 'Total',
                  counter:
                      counterValue == null ? '--' : counterValue.toString(),
                  btnTxt2: "No. of Participants",
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'From',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              Text('SoftKru',
                  style: TextStyle(
                      fontFamily: 'Cubano',
                      foreground: Paint()..shader = linearGradient)),
            ],
          ),
        ),
      ),
    );
  }
}
