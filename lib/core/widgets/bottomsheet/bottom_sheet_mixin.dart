import 'package:dsa_learning/core/widgets/bottomsheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

mixin BottomSheetMixin {
  void showAppBottomSheet({
    required BuildContext context,
    Widget? child,
    double? height,
  }) {
    AppBottomSheet.show(
      context,
      child: child,
    );
  }
}
