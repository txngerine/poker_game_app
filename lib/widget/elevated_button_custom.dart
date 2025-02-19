import 'package:flutter/material.dart';

import 'build_sub_heading_text.dart';

class ElevatedButtonCustom extends StatefulWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback onPress;

  const ElevatedButtonCustom(
      {super.key,
      required this.text,
      this.color,
      required this.onPress,
      this.textColor});

  @override
  State<ElevatedButtonCustom> createState() => _ElevatedButtonCustomState();
}

class _ElevatedButtonCustomState extends State<ElevatedButtonCustom> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: width / 6,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(widget.color)),
          onPressed: widget.onPress,
          child: BuildSubHeadingText(
            text: widget.text,
            fontSize: 10,
            color: widget.textColor,
          )),
    );
  }
}
