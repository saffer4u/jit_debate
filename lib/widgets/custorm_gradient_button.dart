import 'package:flutter/material.dart';
import 'package:jit_debate/constents/colors.dart';

class CustomGradientButton extends StatelessWidget {
  CustomGradientButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
          height: 150,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('icons/plusicon.png'),
              ),
              Text(
                'New',
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'Cubano',
                  fontSize: 30,
                ),
              ),
              Text(
                'Registration',
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
    );
  }
}
