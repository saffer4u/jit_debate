import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jit_debate/constents/colors.dart';

InputDecoration loginInputDecoration(
    {required String label, required String hinttext}) {
  //required parameter provide cumpultion to fill the string
  return InputDecoration(
      labelStyle: TextStyle(color: bgColor),
      errorStyle:
          TextStyle(color: bgColor, fontSize: 14, fontStyle: FontStyle.italic),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: textColor, width: 3.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: textColor, width: 2.0),
      ),
      fillColor: HexColor('103c34'),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: HexColor('103c34')),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: HexColor('103c34'), width: 2.0),
      ),
      labelText: label,
      hintText: hinttext);
}
