import 'dart:math';

import 'package:flutter/material.dart';

class ClockDecoration extends StatelessWidget {
  const ClockDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      width: 550,
      child: CustomPaint(
        painter: SecondMarkersPainter(),
      ),
    );
  }
}

class SecondMarkersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Tính toán bán kính của đồng hồ
    final double radius = size.width / 2;
    for (int h = 0; h < 24; h++) {
      double angle = (h * pi / 12);
      final double xOuter;
      final double yOuter;
      final double xInner;
      final double yInner;
      xOuter = radius * 1.02 * cos(angle); // Vị trí ngoài
      yOuter = radius * 1.02 * sin(angle); // Vị trí ngoài
      xInner = radius * 1.09 * cos(angle); // Vị trí trong
      yInner = radius * 1.09 * sin(angle); // Vị trí trong
      paint.strokeWidth = 3.0;

      canvas.drawLine(
        Offset(size.width / 2 + xOuter, size.height / 2 + yOuter),
        Offset(size.width / 2 + xInner, size.height / 2 + yInner),
        paint,
      );
      final double xText = (radius + 40) * sin(angle);
      final double yText = (radius + 40) * -cos(angle);
      drawText(
          canvas, h.toString(), size.width / 2 + xText, size.height / 2 + yText,
          textStyle: const TextStyle(fontSize: 24, color: Colors.black));
    }
    for (double i = 0; i < 60; i++) {
      // Tính toán góc và vị trí cho mỗi vạch giờ
      final double angle = (i * pi / 30); // 30 độ mỗi giờ
      final double xOuter;
      final double yOuter;
      final double xInner;
      final double yInner;

      xOuter = radius * cos(angle); // Vị trí ngoài
      yOuter = radius * sin(angle); // Vị trí ngoài
      if (i % 5 == 0) {
        xInner = radius * 0.94 * cos(angle); // Vị trí trong
        yInner = radius * 0.94 * sin(angle); // Vị trí trong
        paint.strokeWidth = 4.0;

        final double xText = (radius - 30) * sin(angle);
        final double yText = (radius - 30) * -cos(angle);

        // Vẽ số
        drawText(canvas, (i.toInt()).toString(), size.width / 2 + xText,
            size.height / 2 + yText,
            textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black));
        // Vẽ vạch giờ
      } else {
        xInner = radius * 0.96 * cos(angle); // Vị trí trong
        yInner = radius * 0.96 * sin(angle); // Vị trí trong
        paint.strokeWidth = 1.0;
      }

      canvas.drawLine(
        Offset(size.width / 2 + xOuter, size.height / 2 + yOuter),
        Offset(size.width / 2 + xInner, size.height / 2 + yInner),
        paint,
      );
    }
  }

  // Hàm vẽ số
  void drawText(Canvas canvas, String text, double x, double y,
      {textStyle = const TextStyle(color: Colors.black, fontSize: 16)}) {
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Không cần vẽ lại
  }
}
