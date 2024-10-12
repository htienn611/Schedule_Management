import 'package:flutter/material.dart';

import 'clock_hand_painter.dart';

class MinuteHand extends StatelessWidget {
  const MinuteHand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ClockHandPainter(color: Colors.black, handLength: 170));
  }
}
