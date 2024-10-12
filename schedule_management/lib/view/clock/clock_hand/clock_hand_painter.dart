import 'package:flutter/material.dart';

class ClockHandPainter extends CustomPainter {
  final Color color;
  final double handLength;
  final double handWidth;

  ClockHandPainter({
    required this.color,
    required this.handLength,
    this.handWidth = 8,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Tính toán vị trí của kim
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Vẽ phần kim
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX, centerY - handLength / 2),
          width: handWidth,
          height: handLength,
        ),
        const Radius.circular(0), // Bo tròn góc
      ),
      paint,
    );

    // Vẽ đầu kim (nếu cần có phần đầu bo tròn)
    canvas.drawCircle(
      Offset(centerX, centerY - handLength), // Đỉnh của kim
      handWidth / 2, // Bán kính của đầu bo tròn
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Không cần vẽ lại
  }
}
