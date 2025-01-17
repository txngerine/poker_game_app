import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const BuildTextFieldWidget({
    super.key,
    this.obscureText = false,
    this.suffixIcon,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              keyboardType: keyboardType,
              controller: controller,
              style: const TextStyle(fontSize: 17),
              obscureText: obscureText,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF5F6368),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                suffixIcon: suffixIcon,
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.black26, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.black26, width: 2),
                ),
                filled: true,
                fillColor: Colors.white70,
              ),
              validator: validator,
              inputFormatters: inputFormatters,
            ),
          ),
        ),
        const SizedBox(
            height: 2), // Spacing between TextFormField and error text
      ],
    );
  }
}
