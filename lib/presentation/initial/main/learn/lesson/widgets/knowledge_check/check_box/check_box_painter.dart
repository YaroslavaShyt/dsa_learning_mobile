import 'package:flutter/material.dart';

class CustomCheckboxPainter extends CustomPainter {
  final bool isCorrect;
  final bool isChecked;
  final double size;

  CustomCheckboxPainter({
    required this.isCorrect,
    required this.isChecked,
    required this.size,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color =
          isChecked ? (isCorrect ? Colors.yellow : Colors.red) : Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final double radius = 8.0;
    final Rect rect = Rect.fromLTWH(0, 0, this.size, this.size);
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    canvas.drawRRect(rrect, paint);

    if (isChecked) {
      final Paint checkPaint = Paint()
        ..color = isCorrect ? Colors.yellow : Colors.red
        ..strokeWidth = 3.0
        ..style = PaintingStyle.stroke;

      if (isCorrect) {
        Path checkPath = Path()
          ..moveTo(this.size * 0.3, this.size * 0.5)
          ..lineTo(this.size * 0.45, this.size * 0.65)
          ..lineTo(this.size * 0.7, this.size * 0.35);
        canvas.drawPath(checkPath, checkPaint);
      } else {
        Path crossPath = Path()
          ..moveTo(this.size * 0.3, this.size * 0.3)
          ..lineTo(this.size * 0.7, this.size * 0.7)
          ..moveTo(this.size * 0.7, this.size * 0.3)
          ..lineTo(this.size * 0.3, this.size * 0.7);
        canvas.drawPath(crossPath, checkPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
