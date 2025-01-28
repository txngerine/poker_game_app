import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    // Prevent input length from exceeding 10 (mm/dd/yyyy)
    if (text.length > 10) {
      return oldValue;
    }

    // Automatically insert '/' at appropriate positions
    if (text.length == 2 && !text.contains('/')) {
      text += '/';
    } else if (text.length == 5 && !text.contains('/', 3)) {
      text += '/';
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
