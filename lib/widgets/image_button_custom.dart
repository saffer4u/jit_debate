import 'package:flutter/material.dart';
import 'package:jit_debate/constents/colors.dart';

class ImageButtonCustom extends StatelessWidget {
  final double size;
  const ImageButtonCustom({
    Key? key,
    required this.onDaba,
    required this.imagePath,
    required this.size,
  }) : super(key: key);
  final Function() onDaba;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 5.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        borderRadius: BorderRadius.circular(100),
        color: bgColor,
      ),
      child: Material(
        // needed
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onDaba, // needed
          child: Image.asset(
            imagePath,
            width: 22,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
