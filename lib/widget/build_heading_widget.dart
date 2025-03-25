import 'package:flutter/material.dart';

class BuildHeadingWidget extends StatefulWidget {
  final String text;
  const BuildHeadingWidget({super.key, required this.text});

  @override
  State<BuildHeadingWidget> createState() => _BuildHeadingWidgetState();
}

class _BuildHeadingWidgetState extends State<BuildHeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: Colors.black54,
      ),
    );
  }
}
