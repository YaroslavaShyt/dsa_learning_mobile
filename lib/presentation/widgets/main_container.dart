import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    this.content,
    this.height,
    this.width,
    this.padding = EdgeInsetsDirectional.zero,
    this.margin = EdgeInsetsDirectional.zero,
    this.borderRadius = 20,
    this.color,
    this.showBorder = false,
    this.borderColor,
    super.key,
  });

  final EdgeInsetsDirectional padding;
  final EdgeInsetsDirectional margin;

  final double? borderRadius;
  final double? height;
  final double? width;

  final Widget? content;
  final Color? color;
  final Color? borderColor;

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final Color containerBorderColor =
        borderColor ?? colorScheme.onSurface.withValues(alpha: 0.4);
    final Border? border = showBorder
        ? Border.all(
            width: 2,
            color: containerBorderColor,
          )
        : null;

    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? colorScheme.onSurface.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        border: border,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: content,
    );
  }
}
