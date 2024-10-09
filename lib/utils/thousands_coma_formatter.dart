import 'package:flutter/services.dart';

class ThousandsComaFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    final int selectionIndexFromEnd =
        newValue.text.length - newValue.selection.end;

    final String newText = newValue.text.replaceAll(',', '');
    final StringBuffer newTextWithCommas = StringBuffer();

    int count = 0;
    for (int i = newText.length - 1; i >= 0; i--) {
      if (count != 0 && count % 3 == 0) {
        newTextWithCommas.write(',');
      }
      newTextWithCommas.write(newText[i]);
      count++;
    }

    final String formattedText =
        newTextWithCommas.toString().split('').reversed.join('');

    final int selectionIndexFromEndAfter =
        formattedText.length - selectionIndexFromEnd;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndexFromEndAfter),
    );
  }
}
