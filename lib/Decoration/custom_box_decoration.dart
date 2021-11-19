import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

BoxDecoration customBoxDecoration() {
  return BoxDecoration(
    border: Border.all(color: HexColor('153d35'), width: 2),
    borderRadius: BorderRadius.circular(12),
  );
}
