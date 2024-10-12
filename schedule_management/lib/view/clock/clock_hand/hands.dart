import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'hour_hand.dart';
import 'minute_hand.dart';
import 'second_hand.dart';

class Hands extends StatefulWidget {
  const Hands({super.key});

  @override
  State<Hands> createState() => _HandsState();
}

class _HandsState extends State<Hands> {
  late DateTime time;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    time = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Hủy timer khi không cần thiết nữa
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: (time.hour + time.minute / 60.0) *
              (2 * pi / 24), // Tính góc cho kim giờ với 24 giờ
          child: const HourHand(),
        ),
        // Kim phút
        Transform.rotate(
          angle: (time.minute + time.second / 60.0) *
              (2 * pi / 60), // Tính góc cho kim phút
          child: const MinuteHand(),
        ),
        // Kim giây
        Transform.rotate(
          angle: time.second * (2 * pi / 60), // Tính góc cho kim giây
          child: const SecondHand(),
        ),
        // Điểm trung tâm của đồng hồ
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text("Play",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ],
    );
  }
}
