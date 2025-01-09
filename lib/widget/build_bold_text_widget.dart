import 'package:flutter/material.dart';

class BuildBoldTextWidget extends StatefulWidget {
  final String text;

  const BuildBoldTextWidget({super.key, required this.text});

  @override
  State<BuildBoldTextWidget> createState() => _BuildBoldTextWidgetState();
}

class _BuildBoldTextWidgetState extends State<BuildBoldTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(
          fontSize: 15,
          fontFamily: AutofillHints.birthday,
          color: Colors.black87,
          fontWeight: FontWeight.w600),
    );
  }
}
