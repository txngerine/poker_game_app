import 'package:flutter/material.dart';

class BuildSubHeadingText extends StatefulWidget {
  final String text;
  const BuildSubHeadingText({super.key, required this.text});

  @override
  State<BuildSubHeadingText> createState() => _BuildSubHeadingTextState();
}

class _BuildSubHeadingTextState extends State<BuildSubHeadingText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(
        fontFamily: "CustomFont",
        fontSize: 25,
        shadows: [
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
