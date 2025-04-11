import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransferTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const TransferTextFieldWidget({
    super.key,
    required this.obscureText,
    this.hintText,
    this.suffixIcon,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 67,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/passwordchangeFromTransferpage/text field .png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: keyboardType,
                    controller: controller,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                    obscureText: obscureText,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: hintText,
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 12),
                      contentPadding: const EdgeInsets.fromLTRB(11, 14, 11, 0),
                      filled: true,
                      fillColor: Colors.transparent,
                      errorStyle: const TextStyle(height: 0),
                      helperText: '',
                    ),
                    validator: (value) {
                      if (validator != null) {
                        return validator!(value);
                      }
                      return null;
                    },
                    inputFormatters: inputFormatters,
                  ),
                ),
                if (suffixIcon != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4, right: 4),
                      child: suffixIcon,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
