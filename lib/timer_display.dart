import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final int tempoRestante;

  const TimerDisplay({super.key, required this.tempoRestante});

  String _formatarTempo() {
    int min = tempoRestante ~/ 60;
    int seg = tempoRestante % 60;
    return '${min.toString().padLeft(2, '0')}:${seg.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatarTempo(),
      style: const TextStyle(fontSize: 48),
    );
  }
}
