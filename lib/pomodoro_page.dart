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
  int _tempoEscolhido = 25;

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
      _tempoRestante = _tempoEscolhido * 60;
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
            Padding(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tempo (min)',
                border: OutlineInputBorder(),
              ),
              onChanged: (valor){
                final int? minutos = int.tryParse(valor);
                if (minutos != null && minutos > 0){
                  setState(() {
                    _tempoEscolhido = minutos;
                    _tempoRestante = minutos * 60;
                  });
                }
              },
            ),)
          ],
        ),
      ),
    );
  }
}
