import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

BoxShadow mainBoxShadow(BuildContext context) => BoxShadow(
      color: getColorScheme(context).shadow,
      offset: Offset(4, 4),
      blurRadius: 8,
      spreadRadius: 1,
    );
