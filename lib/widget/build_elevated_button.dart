import 'package:flutter/material.dart';

class BuildElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final Color? color;
  final Color? bgcolor;
  final String text;
  const BuildElevatedButtonWidget(
      {super.key,
      required this.onPress,
      required this.text,
      this.color,
      this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: bgcolor,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
