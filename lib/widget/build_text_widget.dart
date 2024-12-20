import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTextWidget extends StatelessWidget {
  final TextAlign? align;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String text;

  const BuildTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF5F6368),
      ),
    );
  }
}
