import 'package:flutter/material.dart';

class BuildTextWidget extends StatelessWidget {
  final TextAlign? align;
  final FontWeight? fontWeight;
  final double fontSize;
  final String text;
  const BuildTextWidget(
      {super.key,
      required this.text,
      required this.fontSize,
      this.fontWeight,
      this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: Colors.black87),
    );
  }
}
