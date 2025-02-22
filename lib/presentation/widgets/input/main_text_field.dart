import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    this.label,
    this.labelText,
    this.onChanged,
    this.controller,
    this.inputFormatters,
    this.obscureText = false,
    super.key,
  });

  final Widget? label;
  final bool obscureText;
  final String? labelText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: colorScheme.primaryFixed,
      cursorHeight: 20,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        label: label,
        labelText: labelText,
        labelStyle: textTheme.labelSmall,
        floatingLabelStyle: textTheme.labelSmall?.copyWith(
              color: colorScheme.primaryFixed,
            ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primaryFixed,
            width: 2,
          ),
        ),
      ),
    );
  }
}
