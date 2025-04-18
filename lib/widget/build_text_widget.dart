import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTextWidget extends StatelessWidget {
  final TextAlign? align;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String text;
  final Color? color;
  final int? maxLines;

  const BuildTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.align,
    this.color,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      textAlign: align,
      style: GoogleFonts.roboto(
        fontSize: fontSize ?? 15,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? const Color(0xFF5F6368),
      ),
    );
  }
}
