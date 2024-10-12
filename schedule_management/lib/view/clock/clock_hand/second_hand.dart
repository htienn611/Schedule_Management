import 'package:flutter/material.dart';

import 'clock_hand_painter.dart';

class SecondHand extends StatelessWidget {
  const SecondHand({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter:
            ClockHandPainter(color: Colors.red, handWidth: 4, handLength: 220));
  }
}
