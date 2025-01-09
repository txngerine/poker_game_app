import 'package:flutter/material.dart';

class BuildTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const BuildTextFieldWidget({
    super.key,
    this.obscureText = false,
    this.suffixIcon,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            style: const TextStyle(fontSize: 23),
            obscureText: obscureText,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 19,
                color: Color(0xFF5F6368),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(color: Colors.black),
              ),
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
          ),
        ),
        const SizedBox(
            height: 2), // Spacing between TextFormField and error text
        // SizedBox(
        //   height: 20, // Reserve space for the error message
        //   child: Builder(
        //     builder: (context) {
        //       final errorText = Form.of(context)
        //               ?.getFieldError(controller.text.trim())
        //               ?.call(controller.text) ??
        //           null;
        //       return Text(
        //         errorText ?? '',
        //         style: const TextStyle(
        //           fontSize: 14,
        //           color: Colors.red,
        //           height: 1,
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
