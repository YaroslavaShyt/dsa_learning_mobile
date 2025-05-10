import 'package:flutter/material.dart';

class TextParser {
  static List<TextSpan> parseCustomFormattedText(
      String input, TextTheme textTheme) {
    final RegExp tagExp = RegExp(r'(<\/?[bi]>|[^<]+)');
    final matches = tagExp.allMatches(input);
    final List<TextSpan> spans = [];
    final TextStyle baseStyle = textTheme.labelMedium?.copyWith(fontSize: 18) ??
        const TextStyle(
          fontSize: 18,
          fontFamily: 'Nunito',
        );
    TextStyle currentStyle = baseStyle;

    for (final match in matches) {
      final text = match.group(0)!;
      if (text == '<b>') {
        currentStyle = currentStyle.copyWith(fontWeight: FontWeight.w700);
      } else if (text == '</b>') {
        currentStyle = baseStyle;
      } else if (text == '<i>') {
        currentStyle = currentStyle.copyWith(fontStyle: FontStyle.italic);
      } else if (text == '</i>') {
        currentStyle = baseStyle;
      } else {
        spans.add(TextSpan(text: text, style: currentStyle));
      }
    }

    return spans;
  }
}
