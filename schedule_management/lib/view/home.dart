import 'package:flutter/material.dart';

import 'clock/clock.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Schedule Management'),
      ),
      body: const Center(
        child: ClockWidget(),
      ),
    );
  }
}
