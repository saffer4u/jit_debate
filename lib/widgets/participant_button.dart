import 'package:flutter/material.dart';
import 'package:jit_debate/constents/colors.dart';

class ParticipantButton extends StatelessWidget {
  final String btnTxt1;
  final String btnTxt2;
  final String counter;

  final void Function()? onTap;

  ParticipantButton({
    required this.btnTxt1,
    required this.btnTxt2,
    required this.onTap,
    required this.counter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 12,
        primary: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [grdntColor1, grdntColor2],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: double.infinity,
          height: 250,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  counter,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Cubano',
                    fontSize: 110,
                  ),
                ),
                Text(
                  btnTxt1,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Cubano',
                    fontSize: 30,
                  ),
                ),
                Text(
                  btnTxt2,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Cubano',
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
