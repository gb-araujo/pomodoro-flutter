import 'package:flutter/material.dart';
import 'pomodoro_page.dart';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro',
      home: const PomodoroPage(),
    );
  }
}
