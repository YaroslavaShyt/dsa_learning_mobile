import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

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
