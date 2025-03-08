import 'package:dsa_learning/core/widgets/popup/popup.dart';
import 'package:flutter/material.dart';

mixin PopUpMixin {
  void showPopup({
    required BuildContext context,
    Widget? child,
    VoidCallback? onTapOutside,
    VoidCallback? onPositivePressed,
    VoidCallback? onNegativePressed,
  }) {
    PopUp.show(
      context: context,
      onTapOutside: onTapOutside,
      child: child,
      onNegativePressed: onNegativePressed,
      onPositivePressed: onPositivePressed,
    );
  }
}
