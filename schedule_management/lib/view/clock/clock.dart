import 'package:flutter/material.dart';
import 'package:schedule_management/view/clock/clock_decoration.dart';
import 'package:schedule_management/view/clock/clock_hand/hands.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 2), // Viền đen 2px
      ),
      child: Container(
          height: 550,
          width: 550,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2), // Viền đen 2px
          ),
          child: const Stack(
            alignment: Alignment.center,
            children: [RepaintBoundary(child: ClockDecoration()), Hands()],
          )),
    );
  }
}
