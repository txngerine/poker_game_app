import 'package:flutter/material.dart';

class BuildHeadingText extends StatelessWidget {
  final String text;
  const BuildHeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        // fontFamily: "CustomFont",
        fontSize: 30,
        color: Color(0xff454545),

        // shadows: [
        //   Shadow(
        //     color: Color(0xff454545),
        //     // blurRadius: 4,
        //     // offset: Offset(1, 2),
        //   ),
        // ],
      ),
    );
  }
}
