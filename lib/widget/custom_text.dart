import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontsize;
  final Color itemcolor;
  const CustomText({super.key, required this.text, required this.fontWeight, required this.fontsize, required this.itemcolor});

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: TextStyle(
      fontWeight: fontWeight,
        color: itemcolor,
        fontSize: fontsize,

    ),
    );
  }
}
