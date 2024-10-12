import 'package:flutter/material.dart';
import 'package:schedule_management/view/clock/clock_hand/clock_hand_painter.dart';

class HourHand extends StatelessWidget {
  const HourHand({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ClockHandPainter(color: Colors.black, handLength: 110));
  }
}
