import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

InputDecoration buildInputDecoration(
    {required String label, required String hinttext}) {
  //required parameter provide cumpultion to fill the string
  return InputDecoration(
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
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
