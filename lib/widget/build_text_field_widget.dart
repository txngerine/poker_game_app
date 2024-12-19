import 'package:flutter/material.dart';

class BuildTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final Widget? suffixIcon;
  const BuildTextFieldWidget(
      {super.key, this.obscureText = false, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      width: 646,
      child: TextField(
        style: TextStyle(fontSize: 30),
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black),
          ),
          // hintStyle: TextStyle(color: Colors.black38),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Colors.black26,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Colors.black26,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Colors.white70,
        ),
      ),
    );
  }
}
