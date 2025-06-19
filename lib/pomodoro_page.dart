import 'dart:async';
import 'package:flutter/material.dart';
import 'timer_display.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  int _tempoRestante = 1500;
  bool _rodando = false;
  Timer? _timer;

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_tempoRestante > 0) {
        setState(() {
          _tempoRestante--;
        });
      } else {
        timer.cancel();
        setState(() {
          _rodando = false;
        });
      }
    });
    setState(() {
      _rodando = true;
    });
  }

  void _pausarTimer() {
    _timer?.cancel();
    setState(() {
      _rodando = false;
    });
  }

  void _resetarTimer() {
    _timer?.cancel();
    setState(() {
      _tempoRestante = 1500;
      _rodando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pomodoro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerDisplay(tempoRestante: _tempoRestante),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rodando ? _pausarTimer : _iniciarTimer,
              child: Text(_rodando ? 'Pausar' : 'Iniciar'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _resetarTimer,
              child: const Text('Resetar'),
            ),
          ],
        ),
      ),
    );
  }
}
