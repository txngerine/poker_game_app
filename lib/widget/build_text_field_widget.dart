import 'package:flutter/material.dart';

class BuildTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;

  const BuildTextFieldWidget({
    super.key,
    this.obscureText = false,
    this.suffixIcon,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 110,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            style: const TextStyle(fontSize: 23),
            obscureText: obscureText,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFF5F6368),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.black),
              ),
              suffixIcon: suffixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 24, horizontal: 60),
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
              errorStyle: const TextStyle(
                fontSize: 14,
                color: Colors.red,
                height: 1, // Ensure error message does not push other content
              ),
              alignLabelWithHint: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $labelText';
              }
              if (labelText == "Email" &&
                  !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
