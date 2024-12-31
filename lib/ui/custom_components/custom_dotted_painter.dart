import 'package:flutter/cupertino.dart';

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double width;
  final double dashWidth;
  final double dashSpacing;

  DottedBorderPainter({
    required this.color,
    this.width = 1.0,
    this.dashWidth = 4.0,
    this.dashSpacing = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    double startY = 0.0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
