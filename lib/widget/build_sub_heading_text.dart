import 'package:flutter/material.dart';

class BuildSubHeadingText extends StatefulWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? hintText;
  const BuildSubHeadingText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.hintText});

  @override
  State<BuildSubHeadingText> createState() => _BuildSubHeadingTextState();
}

class _BuildSubHeadingTextState extends State<BuildSubHeadingText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.hintText ?? widget.text,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: widget.color,
        fontFamily: "CustomFont",
        fontSize: widget.fontSize ?? 20,
        fontWeight: widget.fontWeight,
        shadows: const [
          Shadow(
            color: Colors.black38,
            blurRadius: 4,
            offset: Offset(1, 2),
          ),
        ],
      ),
    );
  }
}
